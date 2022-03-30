*&---------------------------------------------------------------------*
*& Report ZLISTADO_PRUEBA_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*REPORT ZLISTADO_PRUEBA_YBC.
*
*SELECTION-SCREEN begin of block bl1 with frame title text-001.
*
*SELECT-OPTIONS:
*  O_CAMPO2 FOR ZTYBC_CLIENTES-SUCURSAL,
*  O_CAMPO2 FOR ztybc_clientes-CLAVECLIENTE.
*
*PARAMETERS:
*  P_1 TYPE I.
*
*SELECTION-SCREEN END OF BLOCK BL1.


type-pools: slis. "anterior a v7.40

types: begin of ty_bseg,
       bukrs_it type bseg-bukrs,
       belnr_it type bseg-bukrs,
       gjahr_it type bseg-bukrs,
       werks_it type bseg-bukrs,
       wrbtr_it type bseg-bukrs,
end of ty_bseg.

"tabla con los datos
data: it_bseg type STANDARD TABLE OF ty_bseg,
      it_bkpf type standard table of bkpf.

"TAbla fieldcat (define campo de la tabla)
data: if_cat type standard table of slis_fieldcat_alv,
      wa_fcat type slis_fieldcat_alv.

data: wa_layout type slis_layout_alv,
      vl_variant type disvariant.
refresh: it_fcat, it_bkpf, it_bseg.


clear: wa_fcat.
wa_fcat-fieldname = 'BUKRS_IT'.
wa_fcat-ref_tabname = 'BSEG'.
wa_fcat-ref_fieldname = 'BUKRS'.
wa_fcat-seltext_m = TEXT-002.
wa_fcat-seltext_l = TEXT-002.
wa_fcat-key = 'X'.
wa_fcat-no_zero = 'X'.
APPEND wa_fcat TO it_fcat.



"Armar fieldcat (definir columna del ALV)
clear: wa_fcat.
wa_fcat-fieldname = 'BUKRS_IT'.
wa_fcat-outputlen = 10.
wa_fcat-seltext_s = 'Nº doc.'.
wa_fcat-seltext_m = TEXT-002.
wa_fcat-seltext_l = TEXT-002.
wa_fcat-key = 'X'.
wa_fcat-no_zero = 'X'.
APPEND wa_fcat TO it_fcat.




CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
* EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
*   IT_FIELDCAT                       =
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = ztybc_clientes
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.