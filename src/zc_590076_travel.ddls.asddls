@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_590076_Travel
  provider contract transactional_query
  as projection on ZR_590076_Travel
{
  key TravelUuid,
      TravelId,
      
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: '/DMO/I_Agency_StdVH',
          element: 'AgencyID'
        }
      }]
      AgencyId,
      
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: 'ZI_590076_CustomerVH',
          element: 'CustomerId'
        }
      }]
      CustomerId,
      
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: 'I_CurrencyStdVH',
          element: 'Currency'
        }
      }]
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: 'ZI_590076_StatusVH',
          element: 'Status'
        }
      }]
      Status,

      /* Admin Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Transient Data */
      CustomerName,
      StatusCriticality,
      BeginDateCriticality,

      /* Assosiations */
      _Bookings : redirected to composition child ZC_590076_BOOKING
}
