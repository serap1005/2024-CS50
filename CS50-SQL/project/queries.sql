-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--find all interest rates for a given country by name
SELECT *
FROM "interest_rate"
WHERE "country_id"=(
    SELECT "id"
    FROM "countries"
    WHERE "name" = 'United States'
);
--find interest rate for a specific month and year and country
SELECT *
FROM "interest_rate"
WHERE "country_id" = (
    SELECT "id"
    FROM "countries"
    WHERE "name" = 'United States'
)
AND "month_index" = (
    SELECT "id"
    FROM "year"
    WHERE "month_year" = '2024-09'
);

--find unemployment rate for a specific month and year and country
SELECT *
FROM "unemployment_rate"
WHERE "country_id" = (
    SELECT "id"
    FROM "countries"
    WHERE "name" = 'United States'
)
AND "month_index" = (
    SELECT "id"
    FROM "year"
    WHERE "month_year" = '2024-09'
);

--add new countries
INSERT INTO "countries" ("name","important_figure")
VALUES  ('Canada', 'Tiff Macklem'),
        ('Republic of Korea','Rhee Chang-yong');

--add new entry for interest rate
INSERT INTO "interest_rate" ("country_id", "country_name", "interest_rate", "month_index")
VALUES (
    (SELECT "id" FROM "countries" WHERE "name" = 'United States'),
    'United States',
    '5.50%',
    (SELECT "id" FROM "year" WHERE "month_year" = '2024-09')
);


--add new entry for unemployment rate
INSERT INTO "unemployment_rate" ("country_id", "country_name", "unemployment_rate", "month_index")
VALUES (
    (SELECT "id" FROM "countries" WHERE "name" = 'United States'),
    'United States',
    '4.3%',
    (SELECT "id" FROM "year" WHERE "month_year" = '2024-07')
);


--find highest interest rate in a specific year for given country (us)
SELECT MAX(ir.interest_rate) AS "Highest Interest Rate", y.month_year
FROM "interest_rate" ir
JOIN "year" y ON ir.month_index = y.id
WHERE ir.country_id = (
    SELECT "id"
    FROM "countries"
    WHERE "name" = 'United States'
)
AND y.month_year LIKE '2024%'
GROUP BY y.month_year;

