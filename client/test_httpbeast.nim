import httpbeast
import asynim

proc onRequest(req: Request): Future[void] {.async.} =
    await req.send("Hello from httpbeast")

run(onRequest)