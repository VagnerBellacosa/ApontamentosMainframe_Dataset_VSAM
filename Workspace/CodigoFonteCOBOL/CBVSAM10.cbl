      *****************************************************************
      * DATA     :  31/08/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VSAM KSDS
      *            PROGRAMA COMPLETO COM CRUD E PARM
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. CBVSAM10.
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. AMBIENTE ACADEMICO
       DATE-WRITTEN. 31/08/25 @ 20:40:00.
       DATE-COMPILED. 2025-08-31.
       SECURITY. EXEMPLO PARA ARTIGO LINKEDIN

      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO EMPFILE
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS DYNAMIC
           FILE STATUS  IS FILE-STATUS  VSAM-CODE
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
       77  WSS-DATAN8                PIC 9(08).
       77  WSS-HORAS                 PIC 9(08).
       77  WSS-DATA-COMPIL           PIC X(16).
       77  WSS-TAMANHO               PIC 9(04).
       77  WSS-REG-INSERIDOS         PIC 9(04).
       77  WSS-REG-LIDOS             PIC 9(04).
       77  WSS-REG-atualizados       PIC 9(04).
       77  WSS-REG-EXCLUIDOS         PIC 9(04).
      *
       LINKAGE SECTION.
      *
       01  JCLPARM.
         02  JCLPARM-LENGTH PIC S9(4) BINARY.
         02  JCLPARM-OPCAO  PIC 9(01).
         02  JCLPARM-CHAVE  PIC 9(11).
      *
      **********************************
       PROCEDURE DIVISION USING JCLPARM.
      ***********************************

       MAIN-SECTION                      SECTION.

           PERFORM PROC-INICIAIS.

           PERFORM TRATA-PARM.

           PERFORM PROC-PARM.

           PERFORM PROC-FINAIS.

           STOP RUN.

      *****************************************************************
      * SECTION PARA PREPARAR AMBIENTE
      *****************************************************************
       INICIALIZA-SECTION                SECTION.

       PROC-INICIAIS.

           ACCEPT WSS-DATAN8    FROM DATE YYYYMMDD.
           ACCEPT WSS-HORAS     FROM TIME.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' '.
           DISPLAY '*-----------------------------------------------*'
           DISPLAY '* CBVSAM10                                      *'.
           DISPLAY '* PROGRAMA EXEMPLO CRUD COM SYSIN E ACCEPT      *'.
           DISPLAY '* DATA DE EXECUCAO  : ' WSS-DATAN8
                   '                *'.
           DISPLAY '* HORA DE EXECUCAO  : ' WSS-HORAS
                   '                *'.
           DISPLAY '* DATA DE COMPILACAO: ' WSS-DATA-COMPIL
                   '      *'.
           DISPLAY '*-----------------------------------------------*'
           DISPLAY ' '.

       TRATA-PARM.

           DISPLAY ' '.
           DISPLAY 'TRATA-PARM'.

           IF JCLPARM-LENGTH = 0
              MOVE 'PARAMETRO INVALIDO '
                   TO WSS-MESSAGE
              MOVE 111          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-LENGTH < 12
              MOVE  JCLPARM-LENGTH      TO WSS-TAMANHO
              STRING 'PARAMETRO MENOR DO QUE O ESPERADO '
                                    DELIMITED BY SIZE
                     WSS-TAMANHO    DELIMITED BY SIZE
                     ' BYTES. '     DELIMITED BY SIZE
                 INTO WSS-MESSAGE
              END-STRING
              MOVE 121          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-LENGTH > 12
              MOVE  JCLPARM-LENGTH      TO WSS-TAMANHO
              STRING 'PARAMETRO MAIOR DO QUE O ESPERADO '
                                    DELIMITED BY SIZE
                     WSS-TAMANHO    DELIMITED BY SIZE
                     ' BYTES. '     DELIMITED BY SIZE
                 INTO WSS-MESSAGE
              END-STRING
              MOVE 131          TO  RETURN-CODE
              PERFORM ROT-ABEND
           ELSE
              DISPLAY '* OPCAO : = ' JCLPARM-CHAVE
              DISPLAY 'CHAVE-ID NESTE PROCESSAMENTO = ' JCLPARM-CHAVE
              DISPLAY ' '
           END-IF.

           IF JCLPARM-LENGTH = 0
              MOVE 'PARAMETRO INVALIDO '
                   TO WSS-MESSAGE
              MOVE 113          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-LENGTH > 12
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
              DISPLAY '*---------------------------------------------*'
              DISPLAY '* PARAMETROS RECEBIDOS PARA ESTE PROCESSAMENTO*'
              DISPLAY '* OPCAO                        : ' JCLPARM-OPCAO
              DISPLAY '* CHAVE-ID NESTE PROCESSAMENTO : ' JCLPARM-CHAVE
           END-IF.

           EVALUATE JCLPARM-OPCAO
           WHEN 1
              DISPLAY '* INCLUIR NOVO REGISTRO                       *'
           WHEN 2
              DISPLAY '* LISTAR REGISTRO POR CHAVE                   *'
           WHEN 3
              DISPLAY '* ALTERAR REGISTRO                            *'
           WHEN 4
              DISPLAY '* EXCLUIR REGISTRO                            *'
           WHEN OTHER
              MOVE 'OPCAO INVALIDA     '
                   TO WSS-MESSAGE
              MOVE 114          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-EVALUATE.

           IF JCLPARM-CHAVE = 0
              MOVE 'CHAVE NULA         '
                   TO WSS-MESSAGE
              MOVE 115          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF JCLPARM-CHAVE NOT NUMERIC
              MOVE 'CHAVE INVALIDA     '
                   TO WSS-MESSAGE
              MOVE 116          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           DISPLAY ' '.

       PROC-PARM.

           DISPLAY 'PROC-PARM'.

           perform ROT-OPEN-FILE.

           EVALUATE JCLPARM-OPCAO
           WHEN 1
              PERFORM ROT-RECEBE-SYSIN
              PERFORM PROC-INSERCAO
           WHEN 2
              PERFORM PROC-LEITURA
           WHEN 3
              PERFORM ROT-RECEBE-SYSIN
              PERFORM PROC-ATUALIZACAO
           WHEN 4
              PERFORM PROC-EXCLUSAO
           WHEN OTHER
              MOVE 'OPCAO INVALIDA     '
                   TO WSS-MESSAGE
              MOVE 114          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-EVALUATE.

       ROT-ESTATISTIC-EXIT.
           EXIT.

       ROT-RECEBE-SYSIN.

           DISPLAY 'ROT-RECEBE-SYSIN'.

           INITIALIZE EMPFILE-RECORD

      * Receber todos os parametros da sysin
           ACCEPT EMP-DATA1
           ACCEPT EMP-DATA2
           ACCEPT EMP-VALOR
           ACCEPT EMP-NAME
      *
           PERFORM ROT-VERIFICA-SYSIN.

       ROT-RECEBE-SYSIN-EXIT.
           EXIT.

       ROT-VERIFICA-SYSIN.

           DISPLAY 'ROT-VERIFICA-SYSIN'.

           IF EMP-DATA1 NOT NUMERIC
              MOVE 'DATA INI INVALIDA   '
                   TO WSS-MESSAGE
              MOVE 334          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF EMP-DATA2 NOT NUMERIC
              MOVE 'DATA FIM INVALIDA   '
                   TO WSS-MESSAGE
              MOVE 333          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF EMP-VALOR NOT NUMERIC
              MOVE 'VALOR INVALIDO      '
                   TO WSS-MESSAGE
              MOVE 332          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

           IF EMP-NAME EQUAL SPACES
              MOVE 'NOME INVALIDO      '
                   TO WSS-MESSAGE
              MOVE 331          TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

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

      ******************************************************************
      * PROCESSA DATASET VSAM
      ******************************************************************
       VSAM-SECTION               SECTION.

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           OPEN I-O   EMPFILE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NA ABERTURA DO ARQUIVO EMPFILE '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
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

       PROC-INSERCAO             SECTION.
       ROT-WRITE-REC.

           DISPLAY 'ROT-WRITE-REC'.

      * AUMENTA O SALARIO EM 5123
           ADD 1          TO  WSS-REG-INSERIDOS

           COMPUTE EMP-VALOR  = EMP-VALOR  + 5123

      * REGRAVA O REGISTRO COM O SALARIO AUMENTADO
           MOVE 20240326  TO  EMP-DATA1
           MOVE 20240326  TO  EMP-DATA2
           MOVE 'TESTE NOVO TURMA COB ' TO EMP-NAME
      *
           WRITE EMPFILE-RECORD
                       INVALID KEY MOVE    "REGISTRO NAO ATUALIZADO"
                                 TO WSS-MESSAGE
                                 PERFORM ROT-ABEND
                   NOT INVALID KEY MOVE    "REGISTRO ATUALIZADO"
                                 TO WSS-MESSAGE
      *                          PERFORM ROT-ABEND
                       DISPLAY WSS-MESSAGE
           END-WRITE.

       ROT-WRITE-REC-EXIT.
            EXIT.


       PROC-LEITURA                SECTION.
       ROT-READ-FILE.

           DISPLAY 'ROT-READ-FILE'.

           MOVE JCLPARM-CHAVE  TO EMP-ID.
           ADD 1               TO  WSS-REG-LIDOS.

           READ EMPFILE
                KEY IS EMP-ID
                    INVALID KEY MOVE    'REGISTRO NAO ENCONTRADO'
                              TO WSS-MESSAGE
                              MOVE 100      TO  RETURN-CODE
                              PERFORM ROT-ABEND
                NOT INVALID KEY PERFORM ROT-LEITURA-DISP
           END-READ.

       ROT-READ-FILE-EXIT.
           EXIT.

       ROT-LEITURA-DISP.

           DISPLAY 'ROT-LEITURA-DISP'

           DISPLAY 'EMP-ID        = ' EMP-ID
           DISPLAY 'EMP-DATA1     = ' EMP-DATA1
           DISPLAY 'EMP-DATA2     = ' EMP-DATA2
           DISPLAY 'EMP-VALOR     = ' EMP-VALOR
           DISPLAY 'EMP-NAME      = ' EMP-NAME.
      *
       PROC-ATUALIZACAO           SECTION.

       ROT-REWRITE-REC.

           DISPLAY 'ROT-REWRITE-REC'.

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
      *                          PERFORM ROT-ABEND
                       DISPLAY WSS-MESSAGE
           END-REWRITE.

       ROT-REWRITE-REC-EXIT.
            EXIT.

      *
       PROC-EXCLUSAO              SECTION.

           DISPLAY 'PROC-EXCLUSAO'.

           MOVE JCLPARM-CHAVE  TO EMP-ID.

           DISPLAY 'EMP-ID = ' EMP-ID.

           DELETE EMPFILE
                     INVALID KEY MOVE 'REGISTRO NAO ENCONTRADO'
                                 TO WSS-MESSAGE
                                 MOVE 411 TO  RETURN-CODE
                                 PERFORM ROT-ABEND
                 NOT INVALID KEY MOVE 'REGISTRO APAGADO COM SUCESSO'
                                 TO WSS-MESSAGE
                     ADD 01      TO WSS-REG-LIDOS
           END-DELETE.

           IF FILE-STATUS > 0
              MOVE 'ERRO NO DELETE DO REGISTRO '
                   TO WSS-MESSAGE
              MOVE FILE-STATUS  TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.


      *****************************************************************
      * PROCEDIMENTOS FINAIS
      *****************************************************************
       PROC-FINAIS                    SECTION.

       ROT-ESTATISTIC.

           PERFORM ROT-CLOSE-FILE.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA CBVSAM10                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '*                                         *'.
           DISPLAY '* REGISTROS INSERIDOS    : '
                      WSS-REG-INSERIDOS.
           DISPLAY '* REGISTROS LIDOS        : '
                      WSS-REG-LIDOS.
           DISPLAY '* REGISTROS ATUALIZADOS  : '
                      WSS-REG-atualizados.
           DISPLAY '* REGISTROS EXCLUIDOS    : '
                      WSS-REG-EXCLUIDOS.
           DISPLAY '*******************************************'.

       END PROGRAM CBVSAM10.
      ********************** FIM PROGRAMA   ****************************
