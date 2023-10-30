CLASS zcm_590076_travel DEFINITION PUBLIC
  INHERITING FROM cx_static_check FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    "Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    "Message Constants
    CONSTANTS:
      BEGIN OF test_message,
        msgid TYPE symsgid VALUE 'Z590076_TRAVEL',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_message.

    CONSTANTS:
      BEGIN OF travel_already_cancelled,
        msgid TYPE symsgid VALUE 'Z590076_TRAVEL',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'TRAVEL',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_already_cancelled.

    CONSTANTS:
      BEGIN OF travel_cancelled_successfully,
        msgid TYPE symsgid VALUE 'Z590076_TRAVEL',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'TRAVEL',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_cancelled_successfully.

    "Attributs
    DATA user_name TYPE syuname.
    DATA travel TYPE /dmo/description.

    "Constructor
    METHODS constructor
      IMPORTING
        severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid    LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        previous  LIKE previous OPTIONAL
        user_name TYPE syuname OPTIONAL
        travel    TYPE /dmo/description OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcm_590076_travel IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    me->if_abap_behv_message~m_severity = severity.
    me->user_name = user_name.
    me->travel = travel.
  ENDMETHOD.

ENDCLASS.
