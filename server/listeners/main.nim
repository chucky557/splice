import std/[net, strutils, sequtils]
import listeners

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
# This allows for multiples channels [TCP, UDP, DNS] being configured then listening through the in a round robin manner
