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
   IT_FIELDCAT                       = gt_fcat[].
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





































*type-pools: slis. "anterior a v7.40
*
*types: begin of ty_bseg,
*       bukrs_it type bseg-bukrs,
*       belnr_it type bseg-bukrs,
*       gjahr_it type bseg-bukrs,
*       werks_it type bseg-bukrs,
*       wrbtr_it type bseg-bukrs,
*end of ty_bseg.
*
*"tabla con los datos
*data: it_bseg type STANDARD TABLE OF ty_bseg,
*      it_bkpf type standard table of bkpf.
*
*"TAbla fieldcat (define campo de la tabla)
*data: if_cat type standard table of slis_fieldcat_alv,
*      wa_fcat type slis_fieldcat_alv.
*
*data: wa_layout type slis_layout_alv,
*      vl_variant type disvariant.
*refresh: it_fcat, it_bkpf, it_bseg.
*
*
*clear: wa_fcat.
*wa_fcat-fieldname = 'BUKRS_IT'.
*wa_fcat-ref_tabname = 'BSEG'.
*wa_fcat-ref_fieldname = 'BUKRS'.
*wa_fcat-seltext_m = TEXT-002.
*wa_fcat-seltext_l = TEXT-002.
*wa_fcat-key = 'X'.
*wa_fcat-no_zero = 'X'.
*APPEND wa_fcat TO it_fcat.
*
*
*
*"Armar fieldcat (definir columna del ALV)
*clear: wa_fcat.
*wa_fcat-fieldname = 'BUKRS_IT'.
*wa_fcat-outputlen = 10.
*wa_fcat-seltext_s = 'Nº doc.'.
*wa_fcat-seltext_m = TEXT-002.
*wa_fcat-seltext_l = TEXT-002.
*wa_fcat-key = 'X'.
*wa_fcat-no_zero = 'X'.
*APPEND wa_fcat TO it_fcat.






*"tipo de dato que contiene todas las funciones y varibles necesarias para hacer un reporte ALV
*"VARIABLES PARA LA ESTRUCTURA Y EL LAYOUT DEL REPORTE
*TYPE-POOLS: Slis.
*
*"tabla interna
*DATA: fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE, "catalogo de campos
*      ls_layout TYPE slis_layout_alv, "presentacion del reporte (como queremos que se visualice)
*      i_repid LIKE sy-repid. "variable de sistema que nos dice como se llama nuestro programa (nombre del programa)
*
*"VARIABLES PARA LA CABECERA DEL REPORTE
*DATA: gt_events TYPE slis_t_event WITH HEADER LINE.
*DATA: t_header TYPE slis_t_listheader, "tabla de cabecera
*      l_header TYPE slis_listheader. "linea de cabecera
*
*"ESTRUCTURA DE LA TABLA DE VUELOS
*DATA: BEGIN OF st_spfli.
*      INCLUDE STRUCTURE spfli.
*DATA: traffic_light TYPE c, "luz de trafico
*      line_color(4) TYPE c. "color de la linea de la tabla
*DATA: END OF st_spfli.
*
*"CREAMOS LA TABLA INTERNA
*DATA: it_spfli LIKE TABLE OF st_spfli WITH HEADER LINE.
*
*
*"COMIENZO DE SELECCION
*START-OF-SELECTION.
*
*i_repid = sy-repid.
*
*"TRAER DATOS
*PERFORM extraer_datos.
*
*end-of-selection.




*
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
** EXPORTING
**   I_INTERFACE_CHECK                 = ' '
**   I_BYPASSING_BUFFER                = ' '
**   I_BUFFER_ACTIVE                   = ' '
**   I_CALLBACK_PROGRAM                = ' '
**   I_CALLBACK_PF_STATUS_SET          = ' '
**   I_CALLBACK_USER_COMMAND           = ' '
**   I_CALLBACK_TOP_OF_PAGE            = ' '
**   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
**   I_CALLBACK_HTML_END_OF_LIST       = ' '
**   I_STRUCTURE_NAME                  =
**   I_BACKGROUND_ID                   = ' '
**   I_GRID_TITLE                      =
**   I_GRID_SETTINGS                   =
**   IS_LAYOUT                         =
**   IT_FIELDCAT                       =
**   IT_EXCLUDING                      =
**   IT_SPECIAL_GROUPS                 =
**   IT_SORT                           =
**   IT_FILTER                         =
**   IS_SEL_HIDE                       =
**   I_DEFAULT                         = 'X'
**   I_SAVE                            = ' '
**   IS_VARIANT                        =
**   IT_EVENTS                         =
**   IT_EVENT_EXIT                     =
**   IS_PRINT                          =
**   IS_REPREP_ID                      =
**   I_SCREEN_START_COLUMN             = 0
**   I_SCREEN_START_LINE               = 0
**   I_SCREEN_END_COLUMN               = 0
**   I_SCREEN_END_LINE                 = 0
**   I_HTML_HEIGHT_TOP                 = 0
**   I_HTML_HEIGHT_END                 = 0
**   IT_ALV_GRAPHICS                   =
**   IT_HYPERLINK                      =
**   IT_ADD_FIELDCAT                   =
**   IT_EXCEPT_QINFO                   =
**   IR_SALV_FULLSCREEN_ADAPTER        =
**   O_PREVIOUS_SRAL_HANDLER           =
** IMPORTING
**   E_EXIT_CAUSED_BY_CALLER           =
**   ES_EXIT_CAUSED_BY_USER            =
*  TABLES
*    t_outtab                          = ztybc_clientes
** EXCEPTIONS
**   PROGRAM_ERROR                     = 1
**   OTHERS                            = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
*&---------------------------------------------------------------------*
*& Form extraer_datos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
*FORM extraer_datos .
*  CLEAR: it_spfli.
*  REFRESH: it_spfli.
*  SELECT * FROM spfli INTO CORRESPONDING FIELDS OF TABLE it_spfli.
*
*  LOOP AT it_spfli.
*    IF it_spfli-distance LT 1500.
*      it_spfli-traffic_light = 1.
*      it_spfli-line_color = 'C600'.
*      ELSE.
*        IF it_spfli-distance LT 5000.
*          it_spfli-traffic_light = 2.
*          it_spfli-line_color = 'C300'.
*        ENDIF.
*    ENDIF.
*  ENDLOOP.
*ENDFORM. "Extraer datos
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