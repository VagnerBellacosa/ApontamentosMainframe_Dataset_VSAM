//JVSAM021  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- CRIA INDICE ALTERNATIVO                    ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
       BLDINDEX                           -
       INDATASET(MY.VSAM.KSDSFILE)        -
       OUTDATASET(MY.VSAM.KSDSAIX))
/*
//************************** FIM DE JCL     ****************************
