//CRIAKSDS  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*-------------------------------------------------------------------*
//* DEFINE KSDS CLUSTER                                               *
//*-------------------------------------------------------------------*
/*
 DEFINE CLUSTER ( -
     NAME(PROD.KSDS.CLIENTES) -
     INDEXED -
     KEYS(20 0) -                   /* CHAVE DE 20 BYTES, COME´A NO OFFS
     RECORDSIZE(200 2000) -         /* TAMANHO M•NIMO E MêXIMO */
     FREESPACE(10 10) -             /* RESERVA ESPA´O PARA SPLITS */
     VOLUMES(CICSZ1 CICSZ2) -       /* DISTRIBUI DATA/INDEX EM VOLUMES D
     SHAREOPTIONS(3,3) -            /* COMPARTILHAMENTO (CICS + BATCH) *
     REUSE -                        /* PERMITE REAPROVEITAR DATASET APÏS
  ) -
 DATA (NAME(PROD.KSDS.CLIENTES.DATA) -
       CONTROLINTERVALSIZE(8192) -    /* CI MAIOR = MENOS I/O EM MASSA D
       BUFFERSPACE(524288) -          /* ›REA DE BUFFERS */
       FREESPACE(10 10)) -            /* ESPA´O PARA REGISTROS FUTUROS *
 INDEX (NAME(PROD.KSDS.CLIENTES.INDEX) -
          CONTROLINTERVALSIZE(4096))  /* CI DO •NDICE SEPARADO */
/*
//*-------------------------------------------------------------------*
//*  SE OK LISTA                                                      *
//*-------------------------------------------------------------------*
//LISTCAT    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   IF LASTCC = 0 THEN -
     LISTCAT ALL LEVEL(KC02746.VSAM0125.KSDSFILE.V2108)
/*
//************************** FIM DO JCL ********************************
