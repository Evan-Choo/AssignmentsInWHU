xquery version "1.0";
<results>
    {
        for $p in doc("Flights-Data.xml")/doc/Flight
            where $p/date = "2005-12-24" and $p/source = "NPL"
        return
            $p
    }
</results>