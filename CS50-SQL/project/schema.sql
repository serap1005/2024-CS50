-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it


--table 1 to represent countries
CREATE TABLE "countries"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "important_figure" TEXT NOT NULL,
     PRIMARY KEY ("id")
);

--table 2 represents year, date
CREATE TABLE "year"(
    "id" INTEGER,
    "month_year" TEXT NOT NULL,
    "country_id" INTEGER,
    "country_name" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("country_id") REFERENCES "countries"("id")
);

--table 3 represents changing interest rate

CREATE TABLE "interest_rate" (
    "id" INTEGER,
    "country_id" INTEGER,
    "country_name" TEXT NOT NULL,
    "interest_rate" TEXT NOT NULL,
    "month_index" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("country_id") REFERENCES "countries"("id")
);

--table 4 represents unemployment rate
CREATE TABLE "unemployment_rate" (
    "id" INTEGER,
    "country_id" INTEGER,
    "country_name" TEXT NOT NULL,
    "unemployment_rate" TEXT NOT NULL,
    "month_index" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("country_id") REFERENCES "countries"("id")
);


--INDEX

CREATE INDEX "country_name_search" ON "countries"("name");
CREATE INDEX "year_month_search" ON "year"("month_year");
CREATE INDEX "interest_rate_search" ON "interest_rate"("interest_rate");


--create view to show interest rate and unemployment rate of US over time
CREATE VIEW "US_rate_view" AS
SELECT(
    y.month_year AS "Month and Year",
    ir.interest_rate AS "Interest Rate",
    ur.unemployment_rate AS "Unemployment Rate"
)
FROM year
JOIN
    interest_rate ir ON y.country_id = ir.country_id AND y.id = ir.month_index
JOIN
    unemployment_rate ur ON y.country_id = ur.country_id AND y.id = ur.month_index
WHERE
    y.country_name = 'United States';
