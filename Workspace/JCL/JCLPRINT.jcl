//CATPRINT  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT                                                -*
//*------------------------------------------------------------------*
//PRINT001   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
 PRINT INDATASET(KC02746.VSAM.KSDSEMPR)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 002 USANDO DD NAME                             -*
//*------------------------------------------------------------------*
//PRINT002   EXEC PGM=IDCAMS
//FILE001    DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR                    *VRS014*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
 PRINT INFILE (FILE001)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 003 - FORMATO CHAR E REGISTROS DE 1 A 80       -*
//*------------------------------------------------------------------*
//PRINT003   EXEC PGM=IDCAMS
//FILE001    DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR                    *VRS014*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INFILE (FILE001)            -
   CHAR                              -
   FROMADDRESS (01) TOADDRESS (80)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 004 - FORMATO DUMP E REGISTROS DE 1 A 80       -*
//*------------------------------------------------------------------*
//PRINT004   EXEC PGM=IDCAMS
//FILE001    DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR                    *VRS014*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INFILE (FILE001)            -
   DUMP                              -
   FROMADDRESS (01) TOADDRESS (80)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 005 - FORMATO HEX  E REGISTROS DE 1 A 80       -*
//*------------------------------------------------------------------*
//PRINT005   EXEC PGM=IDCAMS
//FILE001    DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR                    *VRS014*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INFILE (FILE001)            -
   HEX                               -
   FROMADDRESS (01) TOADDRESS (80)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 006 - FORMATO CHAR PULANDO 10 E LISTA 50 APOS  -*
//*------------------------------------------------------------------*
//PRINT006   EXEC PGM=IDCAMS
//FILE001    DD   DSN=KC02746.VSAM.KSDSEMPR,DISP=SHR                    *VRS014*
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INFILE (FILE001)            -
   CHAR                              -
   SKIP (10) COUNT (50)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 008 - FORMATO DO ENDERECO INI ATE FIM          -*
//*------------------------------------------------------------------*
//PRINT008   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INDATASET (KC02746.VSAM.KSDSEMPR) -
        FROMADDRESS(4096)                  -
        TOADDRESS(8191)
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT 009 - FORMATO CHAR PULANDO 10 E LISTA 50 APOS  -*
//*------------------------------------------------------------------*
//PRINT009   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INDATASET (KC02746.VSAM.KSDSEMPR) -
        DBCS                               -
        CHARACTER
/*
//*------------------------------------------------------------------*
//* EXEMPLO DE PRINT DE CATALOGO                                    -*
//*------------------------------------------------------------------*
//PRINT010   EXEC PGM=IDCAMS
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
   PRINT INDATASET (USERCATA)
/*
//************************** FIM DO JCL     ****************************
