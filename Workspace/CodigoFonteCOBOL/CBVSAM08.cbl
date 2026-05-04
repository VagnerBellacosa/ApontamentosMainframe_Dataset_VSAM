      *****************************************************************
      * DATA     :  20/11/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            GRAVA REGISTRO POR CHAVE RECEBIDO VIA SYSIN
      *            apenas no final do arquivo
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVsam08.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/11/23 @ 21:17:00.
       DATE-COMPILED. 2023-11-20.

      **********************
       ENVIRONMENT DIVISION.
      **********************
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO EMPFILE
           ORGANIZATION IS INDEXED
      *    ACCESS MODE  IS RANDOM
           ACCESS MODE  IS sequential
           FILE STATUS  IS FILE-STATUS VSAM-CODE
           RECORD KEY   IS EMP-ID.
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
       01 EMPFILE-RECORD.
          05 EMP-ID        PIC X(05).
          05 EMP-NAME      PIC X(15).
          05 EMP-DESG      PIC X(10).
          05 EMP-SALARY    PIC 9(10).
          05 FILLER        PIC X(40).
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
       77  WSS-REG-GRAVADOS          PIC 9(10).
       77  WSS-DATA-COMPIL           PIC X(16).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'CBVsam08'.
           DISPLAY 'grava registro vsam ksds sequencial'.
           DISPLAY 'apenas no final do arquivo         '.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-recebe-sysin
              THRU ROT-recebe-sysin-exit.

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
      *    OPEN OUTPUT  EMPFILE.
           OPEN EXTEND  EMPFILE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NA ABERTURA DO ARQUIVO EMPFILE '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-RECEBE-SYSIN.

           DISPLAY 'ROT-RECEBE-SYSIN'.

           INITIALIZE EMPFILE-RECORD

      * Receber todos os parametros da sysin
           ACCEPT EMP-ID.
           ACCEPT EMP-NAME.
           ACCEPT EMP-DESG.
           ACCEPT EMP-SALARY.

           display EMP-ID ' - '
                   EMP-NAME ' - '
                   EMP-DESG ' - '
                   EMP-SALARY.

           PERFORM ROT-WRITE-FILE
              THRU ROT-WRITE-FILE-EXIT.

       ROT-RECEBE-SYSIN-EXIT.
           EXIT.

       ROT-WRITE-FILE.
      * grava o registro no arquivo

           DISPLAY 'ROT-WRITE-FILE'.

           initialize  WSS-REG-GRAVADOS.

           display EMPFILE-RECORD.

           WRITE EMPFILE-RECORD.

           IF FILE-STATUS equal zeroes
              display 'registro inserido com sucesso'
              ADD  01      TO    WSS-REG-GRAVADOS
           ELSE
              MOVE    "RECORD INSERTION FAILED"
                 TO WSS-MESSAGE
             MOVE FILE-STATUS  TO  RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

       ROT-WRITE-FILE-EXIT.
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
           DISPLAY '*** PROGRAMA CBVsam08                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTROS GRAVADOS     : '
                      WSS-REG-GRAVADOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

       ROT-ABEND.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' WSS-MESSAGE     : '  WSS-MESSAGE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.

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

       END PROGRAM CBVsam08.
      ********************** FIM PROGRAMA   ****************************
