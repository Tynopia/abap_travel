CLASS zcl_590076_travel_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_590076_travel_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA travel TYPE zda590076_trvl_a.
    DATA travels TYPE TABLE OF zda590076_trvl_a.

    " Delete Travels
    DELETE FROM ZDA590076_TRVL_A.

    " Admin Data
    travel-client = sy-mandt.
    travel-created_by = 'GENERATOR'.
    travel-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD travel-created_at.
    GET TIME STAMP FIELD travel-last_changed_at.

    " Create Travel
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-agency_id = '000023'.
    travel-begin_date = '20230717'.
    travel-booking_fee = 70.
    travel-currency_code = 'USD'.
    travel-customer_id = '000059'.
    travel-description = 'Italienurlaub 2024'.
    travel-end_date = '20230725'.
    travel-status = 'P'.
    travel-total_price = 743.
    travel-travel_id = '00000001'.

    APPEND travel to travels.

    " Create Travel
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-agency_id = '000003'.
    travel-begin_date = '20231027'.
    travel-booking_fee = 40.
    travel-currency_code = 'EUR'.
    travel-customer_id = '000004'.
    travel-description = 'Kurztrip nach Hamburg'.
    travel-end_date = '20231030'.
    travel-status = 'B'.
    travel-total_price = 650.
    travel-travel_id = '00000002'.

    APPEND travel to travels.

    " Create Travel
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-agency_id = '000007'.
    travel-begin_date = '20220210'.
    travel-booking_fee = 54.
    travel-currency_code = 'EUR'.
    travel-customer_id = '000055'.
    travel-description = 'Urlaub nach Malta'.
    travel-end_date = '20220222'.
    travel-status = 'B'.
    travel-total_price = 120.
    travel-travel_id = '00000003'.

    APPEND travel to travels.

    " Insert Travels
    INSERT zda590076_trvl_a FROM TABLE @travels.
  ENDMETHOD.
ENDCLASS.
