//KC02746C  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//* DEFINE KSDS CLUSTER */
 DEFINE CLUSTER ( -
   NAME(KC02746.VSAM.KSDSFILE.T202203) -
   INDEXED -
   RECORDSIZE(80 80) -
   TRACKS(5,5)
   KEYS(5 0) -
   CISZ(4096) -
   REUSE -
   FREESPACE ((3 3) )
 DATA ( -
   NAME(KC02746.VSAM.KSDSFILE.T202203.DATA) -
 INDEX ( -
   NAME(KC02746.VSAM.KSDSFILE.T202203.INDEX)
//*  SE OK LISTA                                                    */
 IF LASTCC = 0 THEN -
 LISTCAT ALL LEVEL(KC02746.STUDENT.FILE)
/*
//
//************************** FIM DE JCL     ****************************
