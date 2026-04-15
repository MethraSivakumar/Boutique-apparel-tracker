CLASS lhc_Apparel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Apparel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Apparel RESULT result.
ENDCLASS.

CLASS lhc_Apparel IMPLEMENTATION.

  METHOD get_global_authorizations.
    " This logic is what enables the 'Create' button in the Fiori UI
    IF requested_authorizations-%create = if_abap_behv=>auth-allowed.
      result-%create = if_abap_behv=>auth-allowed.
    ENDIF.
  ENDMETHOD.

  METHOD get_instance_authorizations.
    " Grant permission for Update and Delete on existing records
    READ ENTITIES OF zi_cit_apparel_071 IN LOCAL MODE
      ENTITY Apparel
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(apparel_data).

    LOOP AT apparel_data INTO DATA(ls_apparel).
      APPEND VALUE #( %tky = ls_apparel-%tky
                      %update = if_abap_behv=>auth-allowed
                      %delete = if_abap_behv=>auth-allowed ) TO result.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
