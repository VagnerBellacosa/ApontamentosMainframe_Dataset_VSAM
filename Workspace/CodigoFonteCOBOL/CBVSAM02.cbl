      *
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. CBVSAM02.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
      *
            SELECT VSAMFILE ASSIGN TO VSAMFILE
            ORGANIZATION IS INDEXED
            ACCESS DYNAMIC
            RECORD KEY IS VSAMFILE-KEY
            FILE STATUS IS FS-CODE VSAM-CODE.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       FD  VSAMFILE
           RECORD  80.
       01  VSAMFILE-REC.
       10 VSAMFILE-KEY             PIC X(5).
       10 FILLER                   PIC X(75).
      *
       WORKING-STORAGE SECTION.
      *
       01  RETURN-STATUS.
       05 FS-CODE                  PIC XX.
       05 VSAM-CODE.
         10 VSAM-RETURN-CODE      PIC S9(2) USAGE BINARY.
         10 VSAM-COMPONENT-CODE   PIC S9(1) USAGE BINARY.
         10 VSAM-REASON-CODE      PIC S9(3) USAGE BINARY.
      *
       PROCEDURE DIVISION.
      *
           OPEN  INPUT VSAMFILE.
           DISPLAY "OPEN INPUT VSAMFILE FS-CODE: " FS-CODE.

           IF FS-CODE NOT = "00"
             PERFORM VSAM-CODE-DISPLAY
             STOP RUN
           END-IF.

           MOVE "000005" TO VSAMFILE-KEY.

           START VSAMFILE KEY IS EQUAL TO VSAMFILE-KEY.

           DISPLAY "START VSAMFILE KEY="  VSAMFILE-KEY
                   " FS-CODE: "  FS-CODE.
           DISPLAY "START VSAMFILE KEY="  VSAMFILE-KEY
                   " FS-CODE: "  FS-CODE.

           IF FS-CODE NOT = "00"
            PERFORM VSAM-CODE-DISPLAY
           END-IF.

           IF FS-CODE = "00"
             PERFORM READ-NEXT UNTIL FS-CODE NOT = "00"
           END-IF.

           CLOSE VSAMFILE.
           STOP RUN.
      *
       READ-NEXT.

           READ VSAMFILE NEXT.

           DISPLAY "READ NEXT VSAMFILE FS-CODE: " FS-CODE.

           IF FS-CODE NOT = "00"
             PERFORM VSAM-CODE-DISPLAY
           ELSE
             DISPLAY VSAMFILE-REC
           END-IF.
      *
       VSAM-CODE-DISPLAY.
      *
           DISPLAY "VSAM-CODE ==>"
                   " RETURN: "  VSAM-RETURN-CODE,
                   " COMPONENT: "  VSAM-COMPONENT-CODE,
                   " REASON: "  VSAM-REASON-CODE.
