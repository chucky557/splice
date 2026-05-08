import openssl

proc find_print_err()=
    var err = ERR_get_error()
    # told this uses normal system return values 1 -fail
    # 0 - success ssl does the reverse
    if err != 0:
        echo "[-] ERROR: ", ERR_error_string(err, nil)

proc new_context()=
    #create a new context and everything required
    let context = SSL_CTX_new(TLS_server_method())

    # pass in the server file to use on the server side
    var crt_check = SSL_CTX_use_certificate_file(context, "server.crt", SSL_FILETYPE_PEM)
    if crt_check != 1:
        find_print_err()

    #take the server key
    var key_check = SSL_CTX_use_PrivateKey_file(context, "server.key", SSL_FILETYPE_PEM)
    if key_check != 1:
        find_print_err()

    if SSL_CTX_load_verify_locations(context, "ca.crt".cstring, nil) != 1: 
        find_print_err()

    SSL_CTX_set_verify(context, SSL_VERIFY_PEER, nil)

    let ssl = SSL_new(context) 
    if ssl == nil:
        echo "[-] unable to create ssl"
        find_print_err()
        
    if SSL_set_fd(ssl, fd) != 1:
        echo "[-] unable to set socket file discriptot"
        find_print_err()
        
    let ret = SSL_accept(ssl)
    if ret != 1:
        find_print_err()
    #inspect peer cert and creds
    discard SSL_get_peer_certificate(ssl)