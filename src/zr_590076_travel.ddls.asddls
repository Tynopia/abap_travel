@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity ZR_590076_Travel
  as select from zda590076_trvl_a
  composition [0..*] of ZR_590076_Booking      as _Bookings
  association [1..1] to ZI_590076_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId
{
  key travel_uuid     as TravelUuid,
      travel_id       as TravelId,
      agency_id       as AgencyId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      status          as Status,

      /* Admin Data  */
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,

      /* Transient Data */
      _CustomerText.CustomerName,
      case status when 'B' then 3
                  when 'N' then 0
                  when 'X' then 1
                  else 0
      end             as StatusCriticality,
      case when dats_days_between($session.system_date, begin_date) >= 14 then 3
           when dats_days_between($session.system_date, begin_date) >= 7 then 2
           when dats_days_between($session.system_date, begin_date) >= 0 then 1
           else 0
      end             as BeginDateCriticality,

      /* Assosiations */
      _Bookings
}
