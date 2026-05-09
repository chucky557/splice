import std/[net, strutils, sequtils]
import listeners

type 
    session_type = enum {.pure.}
        TCP, DNS, UDP, ALL
proc new_session(ses_type: session_type) =
    if ses_type = session_type.TCP:
        new_tcp_listener()
    elif ses_type = session_type.UDP:
        new_udp_listener()
    elif ses_type = session_type.DNS:
        new_dns_listener()
    elif ses_type = session_type.ALL:
        all_listeners()
#--------- Basic coonfiguration ---------#
let 
    LISTENER_PORT = 8080
    BUFFER_SIZE = 4096

# ------------ BASIC TCP CONNECTION ----------#
proc new_tcp_listener(ip_addr, port=LISTENER_PORT):
    let sock = newSocket()

#------------- UDP LISTENER ----------------#

# ---------- DNS TUNNEL CALLBACK -----------#

# ---------- Round Robin Listener ------------ #
# This allows for multiples channels [TCP, UDP, DNS] being configured 
# then listening through the in a round robin manner

proc create_listener() # types of listener
