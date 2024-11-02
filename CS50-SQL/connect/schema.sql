
--users
--first, last name
--username
--password
CREATE TABLE IF NOT EXISTS "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

--schools and universities
--The name of the school
--The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
--The school’s location
--The year in which the school was founded
CREATE TABLE IF NOT EXISTS "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);


--companies
--The name of the company
--The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
--The company’s location
CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

--connections with people
--mutual connection between users
CREATE TABLE IF NOT EXISTS "connection_people" (
    "id" INTEGER,
    "id_user1" INTEGER NOT NULL,
    "id_user2" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY("id_user1") REFERENCES "users"("id"),
    FOREIGN KEY("id_user2") REFERENCES "users"("id"),
    CHECK ("id_user1" != "id_user2"),
    UNIQUE ("id_user1","id_user2")
);

--connections with schools
--The start date of their affiliation (i.e., when they started to attend the school)
--The end date of their affiliation (i.e., when they graduated), if applicable
--The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)

CREATE TABLE IF NOT EXISTS "connection_schools" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "degree" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

--connections with companies
--The start date of their affiliation (i.e., the date they began work with the company)
--The end date of their affiliation (i.e., when left the company), if applicable
--The title they held while affiliated with the company
CREATE TABLE IF NOT EXISTS "connection_schools" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);





