IDENTIFICATION DIVISION.
PROGRAM-ID. HTTP-REQUEST-PARSER.
AUTHOR. Hippolyte Damay--Glorieux.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 INDEX-FILE PIC X(11) VALUE "/index.html".
01 LOCAL-REQUEST.
   03 LOCAL-REQUEST-TYPE PIC X(4).
   03 LOCAL-REQUEST-PATH PIC X(2048).
   03 LOCAL-REQUEST-PATH-LENGTH PIC 9(4).

LINKAGE SECTION.
01 BUFFER PIC X(1024).
01 BUFFER-LENGTH BINARY-SHORT UNSIGNED.
01 REQUEST.
   03 REQUEST-TYPE PIC X(4).
   03 REQUEST-PATH PIC X(2048).
   03 REQUEST-PATH-LENGTH PIC 9(4).

PROCEDURE DIVISION USING BUFFER, BUFFER-LENGTH, REQUEST.
   MOVE SPACES TO LOCAL-REQUEST-TYPE LOCAL-REQUEST-PATH.
   MOVE ZEROES TO LOCAL-REQUEST-PATH-LENGTH.
   IF BUFFER-LENGTH IS GREATER THAN OR EQUAL TO 5 THEN
      UNSTRING BUFFER(1:BUFFER-LENGTH) DELIMITED BY SPACES INTO
         LOCAL-REQUEST-TYPE LOCAL-REQUEST-PATH
   END-IF.

   INSPECT LOCAL-REQUEST-PATH TALLYING LOCAL-REQUEST-PATH-LENGTH
      FOR CHARACTERS BEFORE SPACES.

   IF LOCAL-REQUEST-PATH(LOCAL-REQUEST-PATH-LENGTH:LOCAL-REQUEST-PATH-LENGTH)
         IS EQUAL TO "/"THEN
      STRING INDEX-FILE DELIMITED BY SIZE
         INTO LOCAL-REQUEST-PATH
         WITH POINTER LOCAL-REQUEST-PATH-LENGTH
         ON OVERFLOW DISPLAY "PATH OVERFLOW !"
      END-STRING
      SUBTRACT 1 FROM LOCAL-REQUEST-PATH-LENGTH
   END-IF.

   MOVE LOCAL-REQUEST TO REQUEST.
GOBACK.
END PROGRAM HTTP-REQUEST-PARSER.
