xquery version "1.0";

declare function local:passenger() as node()
{
    let $flightlightlist as node() :=
    <results>{
            for $passenger in doc("Flights-Data.xml")/doc/Passenger
            
            for $reservation in doc("Flights-Data.xml")/doc/Reservation
                where $reservation/passRef = $passenger/passportnumber
            return
                $reservation/flightRef
        }</results>
    
    return
        $flightlightlist
};

declare function local:busyAirports() as node()
{
    let $reservationesult as node() :=
    <results>{
            for $airport in doc("Flights-Data.xml")/doc/Airport
            let $airportId := $airport/@airId,
                $reservation := <result>{
                        for $airportflight in doc("Flights-Data.xml")/doc/Flight[date = "2005-12-24" and (source = $airportId or destination = $airportId)]
                        let $flightightId := $airportflight/@flightId
                        for $flight in local:passenger()/flightRef
                            where $flight = $flightightId
                        return
                            $flight
                    }</result>
                where count($reservation/flightRef) > 0
                order by count($reservation/flightRef) descending
            
            return
                <airport><name>{string($airportId)}</name><passenegerSum>{count($reservation/flightRef)}</passenegerSum></airport>
        }</results>
    
    return
        $reservationesult
};

local:busyAirports()
