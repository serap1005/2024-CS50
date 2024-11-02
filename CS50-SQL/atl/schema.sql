--Passengers
-- essentials in line: the first name, last name, and age.

CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

--Airlines
--name, concourse We have 7 concourses: A, B, C, D, E, F, and T.


CREATE TABLE IF NOT EXISTS "airlines"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN('A','B','C','D','E','F','T')),
    PRIMARY KEY("id")
);

--Flights
--The flight number. For example, “900”. Just know that we sometimes re-use flight numbers.
--The airline operating the flight. You can keep it simple and assume one flight is operated by one airline.
--The code of the airport they’re departing from. For example, “ATL” or “BOS”.
--The code of the airport they’re heading to
--The expected departure date and time (to the minute, of course!)
--The expected arrival date and time, to the very same accuracy

CREATE TABLE IF NOT EXISTS "flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departure_airport" TEXT NOT NULL,
    "arrival_airport" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);




--Check-Ins
--The exact date and time at which our passenger checked in
--The flight they are checking in for

CREATE TABLE IF NOT EXISTS "checkins"(
    "id" INTEGER,
    "time" NUMERIC NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);




