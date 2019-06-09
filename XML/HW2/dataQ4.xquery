xquery version "1.0";

declare function local:flights($name as xs:string) as node()
{
    let $passengerNumbers as node() := <results>{
            for $passenger in doc("Flights-Data.xml")/doc/Passenger
                where $passenger/name = $name
            return
                $passenger/passportnumber
        }</results>
    
    let $fIds as node() := <results>{
            for $result in doc("Flights-Data.xml")/doc/Reservation
            for $passengerNumber in $passengerNumbers/passportnumber
                where $result/passRef = $passengerNumber
            return
                $result/flightRef
        }</results>
    
    return
        $fIds
};

<results>{
        for $fid in local:flights("Santa Claus")/flightRef
        for $f in /doc/Flight
            where $f/@flightId = $fid
        return
            $f/destination
    }</results>