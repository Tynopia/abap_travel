@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status'
define view entity ZI_590076_StatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' )
{
      @UI.hidden: true
  key domain_name,

      @UI.hidden: true
  key value_position,

      @UI.hidden: true
  key language,

      @EndUserText: {
        label: 'Status',
        quickInfo: 'Status'
      }
      value_low as Status,

      @EndUserText: {
        label: 'Status Text',
        quickInfo: 'Status Text'
      }
      text      as StatusText
}