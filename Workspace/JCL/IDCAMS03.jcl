//LISTC01   JOB    ('J906NPD280508'),TSO.&SYSUID,                       00010000
//          REGION=0M,NOTIFY=&SYSUID,                                   00020000
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A                               00030000
//VSAM01   EXEC PGM=IDCAMS                                              00040000
//SYSPRINT DD SYSOUT=*                                                  00050000
//SYSIN    DD *                                                         00060000
  LISTCAT ENTRIES(KC02746.LIB.VSAM01) ALL                               00080001
/*                                                                      00100000
//************************** FIM DE JCL     ****************************00110002
