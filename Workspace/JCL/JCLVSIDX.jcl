//CATBVAIX  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//* CRIAR UM INDICE ALTERNATIVO NUM ARQUIVO VSAM KSDS               -*
//* NAO CLASSIFICANDO A CHAVE ALTERNATIVA                           -*
//*------------------------------------------------------------------*
//BLDINDX1   EXEC PGM=IDCAMS
//AIXDATA    DD DSN=KC02746.VSAM0125.KSDSAIX.V2608.DATA,
//       DISP=(OLD,CATLG,DELETE),
//       UNIT=SYSDA,SPACE=(TRK,(2,1)),
//       DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//AIXINDX    DD DSN=KC02746.VSAM0125.KSDSAIX.V2608.INDEX,
//       DISP=(OLD,CATLG,DELETE),
//       UNIT=SYSDA,SPACE=(TRK,(1,1)),
//       DCB=(RECFM=FB,LRECL=50,BLKSIZE=200)
//SYSPRINT   DD   SYSOUT=*
//SYSTERM    DD   SYSOUT=*                                              *VRS014*
//SYSOUT     DD   *                                                     *VRS014*
//SYSIN      DD   *
  DEFINE AIX                                      -
    (NAME(KC02746.VSAM0125.KSDSAIX.V2608)         -
         RELATE(KC02746.VSAM0125.KSDSFILE.V2608)  -
         CISZ(4096)                               -
         FREESPACE(20,20)                         -
         KEYS(34 46)                              -
         NONUNIQUEKEY                             -
         RECORDSIZE(80,80))                       -
  DATA  (NAME(                                    -
  KC02746.VSAM0125.KSDSAIX.V2608.DATA,DD=AIXDATA)) -
  INDEX (NAME(                                    -
  KC02746.VSAM0125.KSDSAIX.V2608.INDEX,DD=AIXINDX))
/*
//************************** FIM DO JCL     **************************
