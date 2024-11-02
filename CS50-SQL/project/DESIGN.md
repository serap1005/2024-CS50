# Design Document

By Sera Park

Video overview: <[URL HERE](https://youtu.be/dsMM5LswSbg)>

## Scope

This database for interest rate and unemployment rate project includes all entities necessary to track interest rates and unemployment rates across different countries over time.
Scope included in the database:

-countries: identifying basic information and important figure such as Jerome Powell associated with the country
-years: time (recorded by month of year) in which two rates are recorde, and the country to the data related
-interest rates: interest rate for each country in a specific month and year.
-unemployment rates: unemployment rate for each country in a specific month and year.

Outside of this could be population, inflation rate, delinquency rate, etc.

## Functional Requirements

This database will support CRUD operations for managing countries
Store and track interest rates and unemployment rate for different countries over time
Query data based on time, countries to compare across different time periods

## Representation

Table countries:
id: which specifies the unique ID for the country entry as an integer. This column thus has the primary key constraint applied later.
name: specifies the country name as text.
important figure: specifies an important figure associated with the country as TEXT (e.g., Jerome Powell for the United States).

Table year:
id: which specifies the unique ID for the year entry as an integer. This column thus has the primary key constraint applied later.
month_year: which specifies the month and year as TEXT (e.g., '2024-09').
country_id: which is the ID of the country as an integer. With foreign key constraint, it references the id column in the countries table.
country_name: specifies the name of country as text

Table interest_rate:
id: which specifies the unique ID for the interest rate entry as an integer. This column thus has the primary key constraint applied later.
country_id: which is the ID of the country as an integer. With foreign key constraint, it references the id column in the countries table.
country_name:specifies the name of country as text
interest_rate: stores interest rate
month_index: id corresponds to date entry as an Integer. This will use foregin key constraint, referencing id column in the year table.

Table unemployment_rate:
id: which specifies the unique ID for the unemployment rate entry as an integer. This column thus has the primary key constraint applied later.
country_id: which is the ID of the country as an integer. With foreign key constraint, it references the id column in the countries table.
country_name: specifies the name of country as text
unemployment_rate: stores unemployment rate
month_index: id corresponds to date entry as an Integer. This will use foregin key constraint, referencing id column in the year table.

They all have NOT NULL constraint.
### Entities

Countries
Attributes: id, name, important_figure
Type/Constraints: id is INTEGER and PRIMARY KEY. name and important_figure are TEXT, NOT NULL.
Reasoning: id uniquely identifies a country, and name and important_figure are necessary for referencing and context.

Year
Attributes: id, month_year, country_id, country_name
Type/Constraints: id is PRIMARY KEY. month_year and country_name are TEXT, NOT NULL. country_id is INTEGER with a FOREIGN KEY to Countries(id).
Reasoning: Links specific months and years to countries.

Interest Rate
Attributes: id, country_id, country_name, interest_rate, month_index
Type/Constraints: id is PRIMARY KEY. country_id is FOREIGN KEY to Countries. interest_rate is TEXT, NOT NULL.
Reasoning: Tracks interest rates by country and time.

Unemployment Rate
Attributes: id, country_id, country_name, unemployment_rate, month_index
Type/Constraints: Same as Interest Rate.
Reasoning: Tracks unemployment rates in the same way as interest rates.


Types: INTEGER for IDs and references, TEXT for names and rates.
Constraints: PRIMARY KEY for uniqueness, FOREIGN KEY for referential integrity, NOT NULL to ensure data completeness.

### Relationships

One country is associated with multiple year entries, interest rates, and unemployment rates.
Each Interest Rate and Unemployment Rate entry corresponds to one specific month and year.
A Year entry can have one corresponding interest rate and unemployment rate per country.

## Optimizations
country name search: index on name column in the countries table to speed up queries searching for data based on the country name.

year search: index on month_year column in the year table to accelrate queris that search for specific date.

interest rate search: index on interest_rate column in the interst_rate table to optimize searches for specific interest rates.

## Limitations

The schema assumes that interest and unemployment rates are the most important indicators of economy. However, other metrics should be included to diversify the view of macroeconomy.
Furthermore, the schema does not support customized per-country economic updates, so that the frequency of date is not updated at the same time, which requires advancement.
