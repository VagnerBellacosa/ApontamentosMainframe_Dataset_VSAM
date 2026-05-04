//JVSAM004  JOB ('00'),TSO.&SYSUID,                                     JOB08146
//          REGION=0M,NOTIFY=&SYSUID,
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A
//*------------------------------------------------------------------*
//*------TEMPORARY VSAM DATA SET-------------------------------------*
//*------------------------------------------------------------------*
//VSAM1    DD   DSN=&CLUSTER,DISP=(NEW,PASS),/23'
//              RECORG=ES,SPACE=(1,(10)),AVGREC=M,
//              LRECL=256,STORCLAS=TEMP
//
//
//************************** FIM DE JCL     ****************************
