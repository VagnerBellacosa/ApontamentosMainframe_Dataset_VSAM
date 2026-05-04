      *****************************************************************
      * DATA     :  30/10/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            ACESSO DINAMICO VIA CHAVE EXEMPLO DE USO START
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVSAM01.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/10/23 @ 20:40:00.
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
           BLOCK  CONTAINS 800 CHARACTERS
           DATA RECORD     IS EMPFILE-RECORD.
      *
       01 EMPFILE-RECORD.
          05 EMP-ID        PIC 9(11).
          05 EMP-DATA1     PIC 9(08).
          05 EMP-DATA2     PIC 9(08).
          05 EMP-VALOR     PIC 9(07).
          05 EMP-NAME      PIC X(46).
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
       77  WSS-REG-LIDOS             PIC 9(10).
       77  WSS-DATA-COMPIL           PIC X(16).
       77  WSS-TAMANHO               PIC 9(04).
      *
       LINKAGE SECTION.
      *
       01  JCLPARM.
         02  JCLPARM-LENGTH PIC S9(4) BINARY.
         02  JCLPARM-CHAVE  PIC 9(11).
      *
      **********************************
       PROCEDURE DIVISION USING JCLPARM.
      ***********************************

       MAIN-SECTION                      SECTION.

           PERFORM ROT-DISP-INI.
           PERFORM ROT-VALID-PARAM.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-START-FILE
              THRU ROT-START-FILE-EXIT.

      *    PERFORM ROT-READ-FILE
      *       THRU ROT-READ-FILE-EXIT.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-ESTATISTIC
              THRU ROT-ESTATISTIC-EXIT.

           STOP RUN.

      ****************************************************************
      * SECAO TRATA ARQUIVOS *****************************************
      ****************************************************************
       ARQUIVOS-SECTION                  SECTION.

           DISPLAY 'ARQUIVOS SECTION'.

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           OPEN INPUT EMPFILE.
      *    OPEN I-O   EMPFILE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NA ABERTURA DO ARQUIVO EMPFILE '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-START-FILE.
      * POSICIONA O PONTEIRO NO REGISTRO PARA A LEITURA

           DISPLAY 'ROT-START-FILE'.

      *    MOVE 'E0003'        TO EMP-ID.
           MOVE JCLPARM-CHAVE  TO EMP-ID.

           DISPLAY ' EMP-ID = ' EMP-ID.

           START EMPFILE
                 KEY IS EQUAL TO EMP-ID
                     INVALID KEY MOVE 'CHAVE INVALIDA DE REGISTRO'
                                 TO WSS-MESSAGE
                                 PERFORM ROT-ABEND
                 NOT INVALID KEY PERFORM ROT-READ-FILE
                                    THRU ROT-READ-FILE-EXIT
           END-START.

       ROT-START-FILE-EXIT.
           EXIT.

       ROT-READ-FILE.
      * LER TODOS OS REGISTROS SEQUENCIALMENTE VIA NEXT RECORD
      * ATE ENCONTRAR O FINAL DE ARQUIVO.

           DISPLAY 'ROT-READ-FILE'.
           DISPLAY ' '.

           PERFORM UNTIL WSS-EOF

              ADD  01                 TO   WSS-REG-LIDOS
              READ EMPFILE
                   NEXT RECORD
                     AT END SET WSS-EOF TO TRUE
                   NOT AT END DISPLAY EMPFILE-RECORD
              END-READ

              IF FILE-STATUS > 0 AND WS-NOT-EOF
                MOVE 'ERRO NA LEITURA DO ARQUIVO EMPFILE '
                    TO WSS-MESSAGE
                MOVE FILE-STATUS  TO  RETURN-CODE
                PERFORM ROT-ABEND
              END-IF

              IF WS-NOT-EOF
                DISPLAY ' EMP-ID     = ' EMP-ID
                        ' EMP-DATA1  = ' EMP-DATA1
                        ' EMP-DATA2  = ' EMP-DATA2
                        ' EMP-VALOR  = ' EMP-VALOR
                        ' EMP-NAME   = ' EMP-NAME
              END-IF

           END-PERFORM.

           DISPLAY ' '.

       ROT-READ-FILE-EXIT.
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

      ******************************************************************
      * PARAGRAFOS PARA EXCUCAO DE CODIGO DA ARQUITURA DO AMBIENTE     *
      ******************************************************************
       ARQUITETURAL-SECTION              SECTION.

       ROT-DISP-INI.

           DISPLAY '+------------------------------------------+'
           DISPLAY '! CBVSAM01                                 !'
           DISPLAY '! LER VSAM KSDS POSICIONANDO START ATE EOF !'
           DISPLAY '! PARAMETRO : JCLPARM-CHAVE  = '
                                         JCLPARM-CHAVE    '    !'
           DISPLAY '+------------------------------------------+'
           DISPLAY ' '.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.


       ROT-VALID-PARAM.

           DISPLAY '! COMPRIMENTO DO PARAMETRO = ' JCLPARM-LENGTH

           IF JCLPARM-LENGTH = 0
              MOVE 'PARAMETRO INVALIDO '
                   TO WSS-MESSAGE
              MOVE 113          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-LENGTH < 11
              MOVE  JCLPARM-LENGTH      TO WSS-TAMANHO
              STRING 'PARAMETRO MENOR DO QUE O ESPERADO '
                                    DELIMITED BY SIZE
                     WSS-TAMANHO    DELIMITED BY SIZE
                     ' BYTES. '     DELIMITED BY SIZE
                 INTO WSS-MESSAGE
              END-STRING
              MOVE 143          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-LENGTH > 11
              MOVE  JCLPARM-LENGTH      TO WSS-TAMANHO
              STRING 'PARAMETRO MAIOR DO QUE O ESPERADO '
                                    DELIMITED BY SIZE
                     WSS-TAMANHO    DELIMITED BY SIZE
                     ' BYTES. '     DELIMITED BY SIZE
                 INTO WSS-MESSAGE
              END-STRING
              MOVE 123          TO  RETURN-CODE
              PERFORM ROT-ABEND
           ELSE
              DISPLAY ' START '
              DISPLAY ' CHAVE-ID NESTE PROCESSAMENTO = ' JCLPARM-CHAVE
              DISPLAY ' '
           END-IF.

       ROT-ESTATISTIC.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA CBVSAM02                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO LIDOS    : ' WSS-REG-LIDOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

       ROT-ABEND.

           IF WSS-MESSAGE = 'CHAVE INVALIDA DE REGISTRO'
             MOVE 136   TO  RETURN-CODE
           END-IF.

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

       END PROGRAM CBVSAM01.
      ********************** FIM PROGRAMA   ****************************
