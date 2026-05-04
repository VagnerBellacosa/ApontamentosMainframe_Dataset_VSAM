//CATREPRO  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* COPIA ARQUIVO QSAM PARA ARQUIVO VSAM KSDS                        *
//*------------------------------------------------------------------*
//REPRO001   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//DATAIN     DD   DSN=KC02746.SORT.OUTPUT,DISP=SHR                      *VRS014*
//DATAOUT    DD   DSN=KC02746.VSAM0126.KSDSFILE.V1504,DISP=SHR          *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   REPRO INFILE(DATAIN) -
     OUTDATASET(DATAOUT)
/*
//*------------------------------------------------------------------*
//*  SE OK LISTA                                                     *
//*------------------------------------------------------------------*
//LISTCAT    EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   IF LASTCC = 0 THEN -
     LISTCAT ALL LEVEL(KC02746.VSAM0126.KSDSFILE.V1504)
/*
//************************** FIM DO JCL     ****************************
