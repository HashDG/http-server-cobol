# COBOL HTTP Server

Here's an HTTP Server written in COBOL.

## Compilation and execution

For compilation, you'll need GnuCOBOL 3.1.2.0. Please consider that it had been tested only on a Linux system and is currently only using Linux system calls.

```
git clone https://github.com/HashDG/http-server-cobol.git
cd http-server-cobol
make
./http-server <host> <port>
```

In order to ensure the proper running of the server, just visit the link `http://host:port/` in your browser.

## Note

The server answer Hello World (yahoo).
This version is testing (unsuccessfully) HTML files scraping. If you want to execute it well, just remove the call to HTTP-RESOURCES-SCRAPER.
