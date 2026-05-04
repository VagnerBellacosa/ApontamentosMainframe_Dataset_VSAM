      *****************************************************************
      * DATA     :  30/10/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            READ SIMPLES DE ARQUIVO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVSAM07.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/10/23 @ 20:48:00.
       DATE-COMPILED. 2023-10-30.

      **********************
       ENVIRONMENT DIVISION.
      **********************
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO EMPFILE
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS SEQUENTIAL
           RECORD KEY   IS EMP-ID
           FILE STATUS  IS FILE-STATUS  VSAM-CODE.
      *
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
       FD EMPFILE
           RECORD CONTAINS 80  CHARACTERS
           BLOCK  CONTAINS 800 CHARACTERS
           DATA RECORD     IS EMPFILE-RECORD.
      *
      *01 EMPFILE-RECORD.
      *   05 EMP-ID        PIC X(05).
      *   05 EMP-NAME      PIC X(15).
      *   05 EMP-DESG      PIC X(10).
      *   05 EMP-SALARY    PIC 9(10).
      *   05 FILLER        PIC X(40).
       01 EMPFILE-RECORD.
          05 EMP-ID        PIC 9(11).
          05 EMP-DATA1     PIC 9(08).
          05 EMP-DATA2     PIC 9(08).
          05 EMP-VALOR     PIC 9(07).
          05 EMP-NAME      PIC X(46).
      *
      *
       WORKING-STORAGE SECTION.
      *
       01 WS-VAR.
          05 FILE-STATUS PIC 9(02).
          05 WSS-EOF-SW    PIC X(01).
             88 WSS-EOF              VALUE 'S'.
             88 WS-NOT-EOF           VALUE 'N'.
          05 VSAM-CODE.
             10 VSAM-RETURN-CODE      PIC S9(2) USAGE BINARY.
             10 VSAM-COMPONENT-CODE   PIC S9(1) USAGE BINARY.
             10 VSAM-REASON-CODE      PIC S9(3) USAGE BINARY.
      *
       77  WSS-MESSAGE               PIC X(99).
       77  WSS-REG-LIDOS             PIC 9(05).
       77  WSS-DATA-COMPIL           PIC X(16).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'CBVSAM07'.
           DISPLAY 'LER TODOS OS REGISTROI DE UM ARQUIVO VSAM KSDS'.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-ESTATISTIC
              THRU ROT-ESTATISTIC-EXIT.

           STOP RUN.

      ****************************************************************
      * SECAO TRATA ARQUIVOS *****************************************
      ****************************************************************
       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

      *    OPEN INPUT EMPFILE.
           OPEN I-O   EMPFILE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NA ABERTURA DO ARQUIVO EMPFILE '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.


       ROT-READ-FILE.
      * LER TODOS OS REGISTROS SEQUENCIALMENTE VIA NEXT RECORD
      * ATE ENCONTRAR O FINAL DE ARQUIVO.

           DISPLAY 'ROT-READ-FILE'.

           MOVE 0 TO WSS-REG-LIDOS.

           DISPLAY 'ID            NOME                            '
            '                 DATA ADM  SALARIO'
           DISPLAY '----------------------------------------------'
                   '----------------------------------------------'.

           PERFORM UNTIL WSS-EOF

              READ EMPFILE
                   NEXT RECORD
                            AT END SET WSS-EOF TO TRUE
                        NOT AT END PERFORM ROT-DISPLAY
              END-READ


              IF FILE-STATUS > 0 AND WSS-EOF-SW NOT EQUAL'S'
                MOVE 'ERRO NA LEITURA DO ARQUIVO EMPFILE '
                    TO WSS-MESSAGE
                MOVE FILE-STATUS  TO  RETURN-CODE
                PERFORM ROT-ABEND
              END-IF

              ADD  01                 TO   WSS-REG-LIDOS

           END-PERFORM.

           IF FILE-STATUS > 0 AND WSS-EOF-SW NOT EQUAL'S'
              MOVE 'ERRO NA LEITURA DO ARQUIVO EMPFILE '
                 TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-READ-FILE-EXIT.
           EXIT.

       ROT-DISPLAY.

              DISPLAY  EMP-ID      OF EMPFILE-RECORD ' - '
                       EMP-NAME    OF EMPFILE-RECORD ' - '
                       EMP-DATA1   OF EMPFILE-RECORD ' - '
                       EMP-VALOR   OF EMPFILE-RECORD ' - '.

      *
       ROT-DISPLAY-EXIT.
           EXIT.

       ROT-CLOSE-FILE.

           DISPLAY 'ROT-CLOSE-FILE'.

           CLOSE EMPFILE.

           IF FILE-STATUS > 0
               MOVE 'ERRO NO FECHAMENTO DO ARQUIVO EMPFILE '
                 TO WSS-MESSAGE
             MOVE FILE-STATUS  TO  RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

       ROT-CLOSE-FILE-EXIT.
           EXIT.

       ROT-ESTATISTIC.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA CBVSAM07                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO LIDOS    : ' WSS-REG-LIDOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

       ROT-ABEND.

           IF RETURN-CODE NOT EQUAL ZEROES
             DISPLAY ' '
             DISPLAY '*******************************************'
             DISPLAY ' ABEND PROGRAMADO '
             DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE
             DISPLAY ' WSS-MESSAGE     : '  WSS-MESSAGE
             DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'
             DISPLAY '*******************************************'
           ELSE
             DISPLAY ' WSS-MESSAGE     : '  WSS-MESSAGE
           END-IF.

           PERFORM VSAM-CODE-DISPLAY.

           STOP RUN.

       ROT-ABEND-EXIT.
           EXIT.

       VSAM-CODE-DISPLAY.
      *
           DISPLAY "VSAM-CODE ==>"
                   " RETURN: "  VSAM-RETURN-CODE,
                   " COMPONENT: "  VSAM-COMPONENT-CODE,
                   " REASON: "  VSAM-REASON-CODE.

       VSAM-CODE-DISPLAY-EXIT.
           EXIT.

       END PROGRAM CBVSAM07.
      ********************** FIM PROGRAMA   ****************************
