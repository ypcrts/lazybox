#!/bin/bash
# vi: ft=sh tw=0 ts=2 sw=2 sts=2 et:

set -eu

main () {

  if [[ "$(id -u)" != '0' ]]; then
    >&2 echo 'Need root'
    exit
  fi

  local \
    TABLE4='/sbin/iptables' \
    TABLE6='/sbin/ip6tables'
  if ! has $TABLE4; then
    >&2 echo -e "fatal: Cannot find iptables. Is this Linux?" \
                "iptables works better on Linux. Trust me."
    exit 31
  fi

  if ! has $TABLE6; then
    >&2 echo "warn: ip6tables not found. skipping ipv6 rules."
  fi

  # Hard Reset
  #--------------------------------------------------------------------------------

  # POLICY: Shields Down!
  alltables -P INPUT  ACCEPT
  alltables -P OUTPUT ACCEPT

  # Flush: Flush all rules and burn chains
  for table in nat mangle raw security; do
    alltables -t $table -F
    alltables -t $table -X
  done
  alltables -F
  alltables -X

  # Zero all packet and byte counters
  # alltables -Z


  ################################################################################
  #                              DoS WARNING
  # Sucessfully configure dependent custom chains before adding rules to the
  # builtin chains. Otherwise script failure on any command prior to your INPUT
  # chain, for example, will result in the absence of rules to accept your new
  # SSH connection.
  ################################################################################

  # Chain: IN_TCP22
  #--------------------------------------------------------------------------------

  # Create
  alltables -N IN_TCP

  #alltables -A IN_TCP -p tcp --dport 443 -j ACCEPT
  #alltables -A IN_TCP -p tcp --dport 80  -j ACCEPT

  # SSH: ipv4 tcp port 22 jump to the IN_TCP22 chain
  $TABLE4   -N IN_TCP22
  $TABLE4   -A IN_TCP -p tcp --dport  22     -j IN_TCP22


  # Chain: IN_TCP22  (IPv4 only)
  #--------------------------------------------------------------------------------

  TABLE4_IN_TCP22="$TABLE4 -A IN_TCP22 -m recent --name it22 "
  # (rttl prevents ip spoof)   -- linear --  -- exponential --       -- conn / sec --
  $TABLE4_IN_TCP22 --rttl --rcheck --hitcount  5 --seconds 10     -j DROP  #    3
  $TABLE4_IN_TCP22 --rttl --rcheck --hitcount 10 --seconds 100    -j DROP  #   17
  $TABLE4_IN_TCP22 --rttl --rcheck --hitcount 20 --seconds 1000   -j DROP  #   83
  $TABLE4_IN_TCP22 --rttl --rcheck --hitcount 40 --seconds 10000  -j DROP  #  250
  $TABLE4_IN_TCP22 --set -j ACCEPT


  # Chain: INPUT
  #--------------------------------------------------------------------------------

  # Keep existing connections, like my SSH connection <_<
  alltables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT

  # The loopback interface is a friend
  alltables -A INPUT -i lo -j ACCEPT

  # Death to malformed packets: I'm not some ugly router.
  alltables -A INPUT -m conntrack --ctstate INVALID -j DROP

  alltables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j IN_TCP
  alltables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

  # ICMP ECHO: Yes, you can ping me; I'm RFC-compliant.
  $TABLE4 -A INPUT -p icmp      --icmp-type   echo-request -m conntrack --ctstate NEW -j ACCEPT
  $TABLE6 -A INPUT -p ipv6-icmp --icmpv6-type echo-request -m conntrack --ctstate NEW -j ACCEPT

  # Reject unknown protocols, like Linux does
  # nota: ipv6 does not have proto-unreachable
  $TABLE4 -A INPUT -j REJECT --reject-with icmp-proto-unreachable
  $TABLE6 -A INPUT -j REJECT --reject-with icmp6-port-unreachable


  ################################################################################
  #                         Yet Another DoS WARNING
  # Sucessfully configure all chains before raising policies to DROP. Other
  # script failure on any command prior to your INPUT chain, for example, will
  # result in the absence of rules to accept your new SSH connection.
  ################################################################################


  # POLICY: Shields Up!
  #--------------------------------------------------------------------------------

  alltables -P INPUT   DROP
  alltables -P OUTPUT  ACCEPT
  alltables -P FORWARD DROP
}

# Exit status is 0 if and only if a command exists
has () {
  command -V "$1" >/dev/null 2>&1
}

# Passes arguments to iptables and, if it exists, ip6tables
alltables () {
  $TABLE4 "$@"
  [[ "x$TABLE6" != 'x' ]] && $TABLE6 "$@"
}

main "$@"
