//SUPO#01   JOB ('SUPONPD120511'),TSO.&SYSUID,                          00001000
//          REGION=0M,NOTIFY=&SYSUID,                                   00002000
//          MSGCLASS=T,MSGLEVEL=1,CLASS=A                               00003000
//*-------------------------------------------------------------------* 00004000
//VSAM01   EXEC PGM=IDCAMS                                              00005000
//SYSPRINT DD SYSOUT=*                                                  00006000
//SYSIN    DD *                                                         00007000
 DELETE (KC02746.LIB.VSAM01) PURGE CLUSTER                              00009001
/*                                                                      00009102
//VSAM02   EXEC PGM=IDCAMS                                              00010002
//SYSPRINT DD SYSOUT=*                                                  00011002
//SYSIN    DD *                                                         00012002
 DEFINE CLUSTER (                            -                          00020002
        NAME(KC02746.LIB.VSAM01)             -                          00021002
        CYLINDERS(1 1)                       -                          00030002
        KEYS(10 0)                           -                          00060002
        RECORDSIZE(80 156)                   -                          00070002
        SHAREOPTIONS(2,3)                    -                          00071002
        )                                    -                          00080002
        DATA (NAME(KC02746.LIB.VSAM01.DATA)  -                          00090002
        )                                    -                          00100002
        INDEX(NAME(KC02746.LIB.VSAM01.INDEX) -                          00101002
        )                                                               00102002
/*                                                                      00110000
//************************** FIM DE JCL     ****************************00120002
