import os, strutils, strformat

let version: float = 0.1
#[

proc file_reader(file_to_read: string): string =
  var 
    output: string
    file_path: string
  try:
    file_path = joinPath(getAppDir(),"/../", "rsrc", file_to_read)
    echo file_path
    output = readFile(file_path).strip()
  except Exception as e:
    echo fmt"[-] ERROR: {e.msg}"
  
  return output

]#


proc shell() =
  while true:
    stdout.write("shell >")
    var command = stdin.readLine().strip()
    case command:
    of "exit":
      break
    of "list_sessions":
      echo "The available sessions"
    of "help":
      echo "Splice help menu"
    
    

proc banner() =
  echo fmt"""

  ██████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗
  ██╔══██╗████╗ ████║██║████╗  ██║██╔════╝
  ██║  ██║██╔████╔██║██║██╔██╗ ██║██║  ███╗
  ██║  ██║██║╚██╔╝██║██║██║╚██╗██║██║   █c█║
  ██████╔╝██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝
  ╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
      Adversarial Emulataion Framework
      'wrecking the security illusion'

	VERSION: {version}
  """

proc main() =
  banner()
  # call the oming shell here
  shell()
main()
