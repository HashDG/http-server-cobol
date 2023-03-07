CC=cobc

http-server: http-server.cbl http-request-parser.cbl http-response-generator.cbl http-resources-scraper.cbl errnomessage.so 
	$(CC) -free -x -o http-server http-server.cbl http-request-parser.cbl http-response-generator.cbl http-resources-scraper.cbl

errnomessage.so: errnomessage.cbl get_errno.so
	$(CC) -W errnomessage.cbl

get_errno.so: get_errno.c
	$(CC) -W get_errno.c

clean:
	rm -rf *.so

mrproper: clean
	rm -rf http-server
