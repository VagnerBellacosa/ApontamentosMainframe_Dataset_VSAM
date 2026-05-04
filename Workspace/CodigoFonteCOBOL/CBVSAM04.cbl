      *****************************************************************
      * DATA     :  30/10/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            REGRAVA REGISTRO VIA CHAVE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVSAM04.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/10/23 @ 22:40:00.
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
       77  WSS-REG-atualizados       PIC 9(10).
       77  WSS-DATA-COMPIL           PIC X(16).
       77  WSS-tamanho               PIC X(04).
      *
       LINKAGE SECTION.
      *
       01  JCLPARM.
         02  JCLPARM-LENGTH  PIC S9(4) BINARY.
         02  JCLPARM-Chave PIC 9(11).
      *
      *
      **********************************
       PROCEDURE DIVISION USING JCLPARM.
      **********************************

           perform rot-inits.

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
       rot-inits.

           DISPLAY 'CBVSAM04'.
           DISPLAY 'regrava registros atualizando salario'.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           IF JCLPARM-LENGTH = 0
              MOVE 'PARAMETRO INVALIDO '
                   TO WSS-MESSAGE
              MOVE 113          TO  RETURN-CODE
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
              DISPLAY 'CHAVE-ID NESTE PROCESSAMENTO = ' JCLPARM-CHAVE
              DISPLAY ' '
           END-IF.


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
      * LE o REGistro que necessita ser atualizado

           DISPLAY 'ROT-READ-FILE'.

      * Reading the record that need to update
           MOVE JCLPARM-CHAVE  TO EMP-ID.
           ADD 1               TO  WSS-REG-LIDOS.

           READ EMPFILE
                KEY IS EMP-ID
                    INVALID KEY move    'REGISTRO NAO EXISTE'
                              TO WSS-MESSAGE
                              PERFORM ROT-ABEND
                NOT INVALID KEY PERFORM ROT-REWRITE-REC
                                   THRU ROT-REWRITE-REC-EXIT
           END-READ.

       ROT-READ-FILE-EXIT.
           EXIT.

       ROT-REWRITE-REC.

           DISPLAY 'in ROT-REWRITE-REC'.

           if emp-data1 not numeric
              move zeroes to emp-valor
              display 'erro emp-data1'
           end-if.

           if emp-data2 not numeric
              move zeroes to emp-valor
              display 'erro emp-data2'
           end-if.

           if emp-valor not numeric
              move zeroes to emp-valor
              display 'erro emp-valor'
           end-if.

      * registro lido
           DISPLAY 'antes de alterar '
           DISPLAY 'EMP-ID     ='  EMP-ID
           DISPLAY 'EMP-DATA1  ='  EMP-DATA1
           DISPLAY 'EMP-DATA2  ='  EMP-DATA2
           DISPLAY 'EMP-VALOR  ='  EMP-VALOR
           DISPLAY 'EMP-NAME   ='  EMP-NAME

      * AUMENTA O SALARIO EM 5123
           ADD 1          TO  WSS-REG-atualizados.

           COMPUTE EMP-VALOR  = EMP-VALOR  + 5123

      * REGRAVA O REGISTRO COM O SALARIO AUMENTADO
           MOVE 20240326  TO  EMP-DATA1
           MOVE 20240326  TO  EMP-DATA2
           MOVE 'TESTE NOVO TURMA COB ' TO EMP-NAME
      *
           REWRITE EMPFILE-RECORD
                       INVALID KEY MOVE    "REGISTRO NAO ATUALIZADO"
                                 TO WSS-MESSAGE
                                 PERFORM ROT-ABEND
                   NOT INVALID KEY MOVE    "REGISTRO ATUALIZADO"
                                 TO WSS-MESSAGE
                       DISPLAY WSS-MESSAGE
           END-REWRITE.

      * registro lido
           DISPLAY ' '
           DISPLAY 'apos  de alterar '
           DISPLAY 'EMP-ID     ='  EMP-ID
           DISPLAY 'EMP-DATA1  ='  EMP-DATA1
           DISPLAY 'EMP-DATA2  ='  EMP-DATA2
           DISPLAY 'EMP-VALOR  ='  EMP-VALOR
           DISPLAY 'EMP-NAME   ='  EMP-NAME.

       ROT-REWRITE-REC-EXIT.
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
           DISPLAY '*** PROGRAMA CBVSAM04                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTROS LIDOS        : '
                      WSS-REG-LIDOS.
           DISPLAY '* REGISTROS ATUALIZADOS  : '
                      WSS-REG-atualizados.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

       ROT-ABEND.

           EVALUATE WSS-MESSAGE
             WHEN "REGISTRO NAO EXISTE"
                MOVE 156 TO  RETURN-CODE
             WHEN "REGISTRO NAO ATUALIZADO"
                MOVE 166 TO  RETURN-CODE
             WHEN OTHER
                display wss-message
           END-EVALUATE.

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

       END PROGRAM CBVSAM04.
      ********************** FIM PROGRAMA   ****************************
