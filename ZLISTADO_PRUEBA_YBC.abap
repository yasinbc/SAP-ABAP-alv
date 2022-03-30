*&---------------------------------------------------------------------*
*& Report ZLISTADO_PRUEBA_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlistado_prueba_ybc.

DATA: wa_cliente TYPE ztybc_clientes.
DATA: tl_clientes type table of ztybc_clientes.


*--------------------------------------------------------------------*
* TYPES-POOLS
*--------------------------------------------------------------------*
TYPE-POOLS: slis. "tabla especial listados ALV
*--------------------------------------------------------------------*
* TABLAS INTERNAS / ESTRUCTURAS
*--------------------------------------------------------------------*


SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS:
  o_campo1 FOR wa_cliente-sucursal,
  o_campo2 FOR wa_cliente-clavecliente.

PARAMETERS:
  p_1 TYPE i.

SELECTION-SCREEN END OF BLOCK bl1.

*include zlistado_prueba_ybc.

*------------------------------------------------------------------*
* INITIALIZATION
*------------------------------------------------------------------*
INITIALIZATION.
PERFORM init_data.



*------------------------------------------------------------------*
* Lógica del proceso
*------------------------------------------------------------------*
START-OF-SELECTION.
PERFORM seleccion.



*------------------------------------------------------------------*
* Fin de selección
*------------------------------------------------------------------*
END-OF-SELECTION.
PERFORM listar.
*PERFORM modificar_fcatalog.

DATA: g_pid like sy-repid.
g_pid = sy-repid.

DATA: gt_fcat TYPE slis_t_fieldcat_alv.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
   I_CALLBACK_PROGRAM                = g_pid
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  = tl_clientes
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
   IT_FIELDCAT                       = gt_fcat[]
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
    t_outtab                          = tl_clientes
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2
          .
IF sy-subrc <> 0.
  MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.





































*&---------------------------------------------------------------------*
*& Form init_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM init_data .
"borramos la tabla interna
  CLEAR:
    o_campo1,
    o_campo2.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form seleccion
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM seleccion .

ENDFORM.
*&---------------------------------------------------------------------*
*& Form listar
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM listar .

ENDFORM.
*&---------------------------------------------------------------------*
*& Form modificar_fcatalog
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*FORM modificar_fcatalog.

*  FIELDS-SIMBOL:
*  <fs_fcat> TYPE slis_fieldcat_alv.
*
*  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
*    EXPORTING
*      I_PROGRAM_NAME             = g_pid
**      I_INTERNAL_TABNAME         = c_internal_tabname
*      I_STRUCTURE_NAME           = 'ZLISTDO_PRUEBA_YBC'
*      CHANGING
*          ct_fieldcat                = gt_fcat
*    EXCEPTIONS
*      inconsistent_interface     = 1
*      program_error              = 2
*      OTHERS                     = 3
*
*    IF sy-subrc <> 0.
*      ESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.
*
*    "MODIFICAMOS LA CABECERA DE LAS COLUMNAS
*        LOOP AT gt_fcat ASSIGNING <fs_fcat>.
*
*          IF <fs_fcat>-fieldname = 'CAMPO_1'.
*
*             <fs_fcat>-seletext_1 = 'Cliente'.
*             <fs_fcat>-seltext_m =  'Cliente'.
*             <fs_fcat>-seltext_s = 'Cliente'.
*             <fs_fcat>-REPTEXT_DDIC = 'Cliente'.
*
*          ELSEIF <fs_fcat>-fieldname = 'CAMPO_2'.
*
*             <fs_fcat>-seltext_l = 'Número de Cliente'.
*             <fs_fcat>-seltext_m = 'Num. Cliente'.
*             <fs_fcat>-seltext_s = 'NCliente'.
*             <fs_fcat>-REPTEXT_DDIC = 'Número de Cliente'.
*
*          ENDIF.
*
*       ENDLOOP. "at gt_fcat
*
*ENDFORM.