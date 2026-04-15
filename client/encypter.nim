import math
proc xor_encrypt(key: char, data: string): string =
    result = newString(data.len())
 
    for i in 0..data.len:
        result[i] = chr(ord(data[i]) xor ord(key))



proc main()=
    var
        roblox: char = 'K'
        data: string = "http://172.16.152.1:1337/backdoor.dll"
        output: string
    
    output = xor_encrypt(roblox, data)
    echo output 

main()