CLASS lhc_ZR_590076_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_590076_Travel RESULT result.
    METHODS show_message FOR MODIFY
      IMPORTING keys FOR ACTION travel~show_message.
    METHODS cancel_travel FOR MODIFY
      IMPORTING keys FOR ACTION travel~cancel_travel.

ENDCLASS.

CLASS lhc_ZR_590076_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD show_message.
    DATA(message) = NEW zcm_590076_travel(
      severity  = if_abap_behv_message=>severity-information
      textid    = zcm_590076_travel=>test_message
      user_name = sy-uname
    ).

    APPEND message TO reported-%other.
  ENDMETHOD.

  METHOD cancel_travel.
    DATA message TYPE REF TO zcm_590076_travel.

    " Reisen lesen
    READ ENTITY IN LOCAL MODE ZR_590076_Travel
      FIELDS ( Status Description ) WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    " Reisen sequentiell verarbeiten
    LOOP AT travels INTO DATA(travel).
      " Validierung durchführen (+ Fehlermeldung erzeugen)
      IF travel-Status = 'X'.
        message = NEW zcm_590076_travel(
          textid    = zcm_590076_travel=>travel_already_cancelled
          travel    = travel-Description
        ).

        APPEND VALUE #( %tky = travel-%tky %msg = message ) TO reported-travel.
        APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.
        CONTINUE.
      ENDIF.

      " Status anpassen (+ Erfolgsmeldung erzeugen)
      travel-Status = 'X'.

      message = NEW zcm_590076_travel(
        severity = if_abap_behv_message=>severity-success
        textid    = zcm_590076_travel=>travel_cancelled_successfully
        travel    = travel-Description
      ).

      APPEND VALUE #( %tky = travel-%tky %msg = message ) TO reported-travel.

      " Reisen zurückschreiben
      MODIFY ENTITY IN LOCAL MODE ZR_590076_Travel
        UPDATE FIELDS ( Status )
        WITH VALUE #( ( %tky = travel-%tky Status = travel-Status ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
