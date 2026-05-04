//JVSAM021  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*---- CRIA INDICE ALTERNATIVO                    ------------------*
//*------------------------------------------------------------------*
//STEP1  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
   DEFINE CLUSTER (NAME(KC02746.VSAM.KSDSFILE)  -
   INDEXED                                 -
   RECSZ(200 200)                          -
   TRACKS(1,1)                             -
   KEYS(5  0)                              -
   CISZ(4096)                              -
   FREESPACE(3 3) )                        -
   DATA (NAME(KC02746.VSAM.KSDSFILE.DATA))      -
   INDEX (NAME(KC02746.VSAM.KSDSFILE.INDEX))
/*
//*------------------------* FIM DO JCL     *--------------------------*
