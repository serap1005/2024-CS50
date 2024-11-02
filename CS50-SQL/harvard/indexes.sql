CREATE INDEX "student_index" ON "students" ("student_id", "course_id");

CREATE INDEX "student_name" ON "students" ("name");

CREATE INDEX "course_2023" ON "courses" ("id","department","semester","title")
WHERE "semester" = 2023;

CREATE INDEX "course_2024" ON "courses" ("id","department","semester","title")
WHERE "semester" = 2024;

CREATE INDEX "course_select" ON "courses" ("deparment","number","semester","title");
