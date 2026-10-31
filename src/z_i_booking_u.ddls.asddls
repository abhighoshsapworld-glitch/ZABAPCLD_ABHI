@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking details'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_Booking_U as select from /dmo/booking
  association to parent Z_I_Travel_U as _Travel on $projection.TravelID = _Travel.TravelID
{
  key travel_id     as TravelID,
  key booking_id    as BookingID,
      booking_date  as BookingDate,
      customer_id   as CustomerID,
      carrier_id    as CarrierID,
      connection_id as ConnectionID,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      
      _Travel
}
