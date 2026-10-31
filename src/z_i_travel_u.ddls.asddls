@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'travel header view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_Travel_U as select from /dmo/travel
composition [0..*] of Z_I_Booking_U as _Booking
  association [1..1] to /DMO/I_Agency      as _Agency   on $projection.AgencyID = _Agency.AgencyID
  association [1..1] to /DMO/I_Customer    as _Customer on $projection.CustomerID = _Customer.CustomerID
{
  key travel_id     as TravelID,
      agency_id     as AgencyID,
      customer_id   as CustomerID,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as OverallStatus,
//      created_by    as CreatedBy,
//      created_at    as CreatedAt,
//      last_changed_by as LastChangedBy,
//      last_changed_at as LastChangedAt,
      
      // Make associations public
      _Booking,
      _Agency,
      _Customer
}
