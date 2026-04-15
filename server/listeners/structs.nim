import std/random

type
    session_id: string
    target_os: string
    ip_address: string

proc new_session()=
    const chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHHIJKLMNOPQRSTUVWXYZ!~@#$%^&*()"

    for  in chars:
        