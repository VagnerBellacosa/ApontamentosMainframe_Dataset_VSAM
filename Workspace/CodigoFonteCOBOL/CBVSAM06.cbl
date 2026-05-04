      *****************************************************************
      * DATA     :  30/10/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            PRIMEIRO ACESSO ARQUIVO VAZIO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVSAM06.
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
           ACCESS MODE  IS DYNAMIC
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
           DATA RECORD     IS EMPFILE-RECORD.
      *
       01 EMPFILE-RECORD.
          05 EMP-ID        PIC X(11).
          05 FILLER        PIC X(69).
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

           DISPLAY 'CBVSAM06'.
           DISPLAY 'VARIAVEL HIERARQUIVA NIVEL 01'.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-WRITE-FILE
              THRU ROT-WRITE-FILE-EXIT.

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
           OPEN OUTPUT EMPFILE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NA ABERTURA DO ARQUIVO EMPFILE '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-WRITE-FILE.

           DISPLAY 'ROT-WRITE-FILE'.

           ADD 01 TO WSS-REG-GRAVADOS.

           WRITE EMPFILE-RECORD
                     INVALID KEY MOVE 'REGISTRO NAO GRAVADO'
                                 TO WSS-MESSAGE
                                 PERFORM ROT-ABEND
                 NOT INVALID KEY MOVE 'REGISTRO GRAVADO'
                                 TO WSS-MESSAGE
           END-WRITE.

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
           DISPLAY '*** PROGRAMA CBVSAM06                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO GRAVADOS    : ' WSS-REG-GRAVADOS.
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

       END PROGRAM CBVSAM06.
      ********************** FIM PROGRAMA   ****************************
