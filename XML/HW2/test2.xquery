xquery version "1.0";

declare function local:flights($name as xs:string) as node()
{
    let $passengerNumbers as node() := 
    <results>
    {
    for $passenger in doc("Flights-Data.xml")/doc/Passenger
    where $passenger/name = $name
    return $passenger/passportnumber
    }
    </results>
    
    let $flightIds as node() :=
    <results>
    {
    for $reservation in doc("Flights-Data.xml")/doc/Reservation
    for $passengerNumber in $passengerNumbers/passportnumber
    where $reservation/passRef = $passengerNumber
    return $reservation/flightRef
    }
    </results>
    
    return $flightIds
};

<results>{
    for $flightid in local:flights("Santa Claus")/flightRef
    for $flight in doc("Flights-Data.xml")/doc/Flight
    where $flight/@flightId = $flightid
    return $flight/destination
}
</results>