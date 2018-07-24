import os
import cgi
import sys
from BaseHTTPServer import HTTPServer, BaseHTTPRequestHandler
import simplejson
PORT=8000
class customHTTPServer(BaseHTTPRequestHandler):
        def do_POST(self):
                content_len = int(self.headers.getheader('content-length', 0))
                post_body = self.rfile.read(content_len)
                test_data = simplejson.loads(post_body)
                out_put_book(test_data["repository"]["name"], test_data["repository"]["name"])    
                self.send_response(200)
                self.end_headers()
                self.wfile.write('Post!')
                
def main(port):
        try:
                server = HTTPServer(('',port),customHTTPServer)
                print 'server started at %s ' % port
                server.serve_forever()
        except KeyboardInterrupt:
                server.socket.close() 
 
if __name__=='__main__':
  if len(sys.argv) == 2:
    main(port=int(sys.argv[1]))
  else:
    main(PORT)
