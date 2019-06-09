xquery version "1.0";

declare function local:findBusies($date as xs:string?) as node()
{
    let $busies := <results>{
            for $airport in doc("Flights-Data.xml")/doc/Airport
            let $name := $airport/@airId,
                $result := <result>
                    {
                        for $flight in doc("Flights-Data.xml")/doc/Flight[date = $date]
                            where $flight/source = $name or $flight/destination = $name
                        return
                            $flight
                    }</result>
                order by count($result/Flight) descending
            return
                <busiestAirport><flightSum>{count($result/Flight)}</flightSum><name>{string($name)}</name></busiestAirport>
        }</results>
    return
        $busies/busiestAirport[1]
};

local:findBusies("2005-12-24")