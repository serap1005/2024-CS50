--view named rural
-- all census records relating to rural municipality
--all columns from census table
CREATE VIEW "rural" AS
SELECT "id", "district", "locality", "families", "households", "population", "male", "female"
FROM "census"
WHERE "locality" LIKE '%Rural%';

