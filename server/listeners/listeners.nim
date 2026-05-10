import std/random
import strformat
import openssl, net, mtls

type
    Session* = object
        session_id*: string
        target_os*: string
        ip_address*: string

proc new_session_id*(session: var Session) =
    const chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHHIJKLMNOPQRSTUVWXYZ!~@#$%^&*"
    
    var length_of_id = 8
    try:
        # initialize the random number generator
        randomize() 
        echo fmt"[+] Generating a new session id ..."
        # clear session of anything
        session.session_id.setLen(0)
        #var result: string
        for _ in 0..<length_of_id:
            session.session_id.add chars.sample()
        echo session.session_id
    except Exception as rand_error:
        echo fmt"[-] Failed to generate session id: {rand_error.msg}"