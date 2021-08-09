*&---------------------------------------------------------------------*
*& Report ZDELETE_MD_REQUESTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDELETE_MD_REQUESTS.

 "This report will delete all master data requestes.

DATA: lt_requests type RSSM_T_REQUEST.

PARAMETERS: pa_iobj type RSINFOPROV.

 "Please validate the list before run
SELECT request as RNR
  from RSBKREQUEST
  into table @lt_requests
  WHERE tgt = @pa_iobj
  and targetstate <> 4.

Call function 'RSSM_PROCESS_REQUDEL_MDT'
  EXPORTING
    I_DTA               =   pa_iobj               " Master Data / texttab
*    I_REQUEST           = SPACE            " Request number for the data transfer
*    I_JOBNAME           =                  " Background Job Name
*    I_VARIANT           =                  " Process Variant (Name)
*    I_INSTANCE          =                  " Process Instance (Value)
    I_T_RNR             = LT_REQUESTS
*    I_COMPLETE_DEL_DTPR = RS_C_TRUE
*  IMPORTING
*    E_ERROR             =                  " Boolean
*    E_T_MSG             =                  " BW: Table with Messages (Application Log)
  .
