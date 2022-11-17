CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar UNIQUE,
  "password" varchar,
  "age" int,
  "role" uuid
);

CREATE TABLE "course" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" uuid,
  "teacher" uuid
);

CREATE TABLE "courseCategories" (
  "categories" uuid,
  "course" uuid
);

CREATE TABLE "courseUsers" (
  "users" uuid,
  "course" uuid
);

CREATE TABLE "level" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "courseVideo" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course" uuid
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "role" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("role") REFERENCES "role" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("level") REFERENCES "level" ("id");

ALTER TABLE "courseVideo" ADD FOREIGN KEY ("course") REFERENCES "course" ("id");

ALTER TABLE "courseCategories" ADD FOREIGN KEY ("categories") REFERENCES "categories" ("id");

ALTER TABLE "courseCategories" ADD FOREIGN KEY ("course") REFERENCES "course" ("id");

ALTER TABLE "courseUsers" ADD FOREIGN KEY ("users") REFERENCES "users" ("id");

ALTER TABLE "courseUsers" ADD FOREIGN KEY ("course") REFERENCES "course" ("id");

INSERT INTO "categories"(
	id, name)
	VALUES ('17951794-d2c1-407b-b24b-ea06e6c58c97','backend'),('dc492263-c06e-460e-adcc-db3801fa6d51','frontend');

  INSERT INTO "level"(
	id, name)
	VALUES ('d2667ce1-385b-425e-b7d9-56b7c7c78d16','principiante'),('ffe35be4-3b86-41c8-ada9-373f0c2418d0','intermedio'),('dcaf822a-0074-4636-9638-0cda0f871f6b','avanzado');

INSERT INTO "role"(
	id, name)
	VALUES ('f05fe461-68c7-49aa-9042-46863e1ac762','student'),('067f0dcc-eea3-4e3e-bf28-461cba050de6','teacher'),(gen_random_uuid(),'admin');

  INSERT INTO "users"(
	id, name, email, password, age, role)
	VALUES ('3bd95199-3f7f-4e25-8a97-c8d2c507eddc', 'josue', 'josue465@hotmail.com', '1234', '27', '067f0dcc-eea3-4e3e-bf28-461cba050de6'),
	('f51b1a71-a59b-4dee-aab1-3fa56153c12c', 'Camilo', 'Camilo465@hotmail.com', '1234', '20', 'f05fe461-68c7-49aa-9042-46863e1ac762');


INSERT INTO "course"(
	id, title, description, level, teacher)
	VALUES ('1ea5b1e4-bbf1-488a-aff8-4ffef0b8c726', 'nodejs', 'curso completo', 'd2667ce1-385b-425e-b7d9-56b7c7c78d16', '3bd95199-3f7f-4e25-8a97-c8d2c507eddc'),
	('f542e89d-54d1-470e-8e6f-c50d029517ae', 'react', 'curso completo', 'd2667ce1-385b-425e-b7d9-56b7c7c78d16', '3bd95199-3f7f-4e25-8a97-c8d2c507eddc');

  INSERT INTO "courseCategories"(
	categories, course)
	VALUES ('17951794-d2c1-407b-b24b-ea06e6c58c97', '1ea5b1e4-bbf1-488a-aff8-4ffef0b8c726'),
	('dc492263-c06e-460e-adcc-db3801fa6d51', 'f542e89d-54d1-470e-8e6f-c50d029517ae');

  INSERT INTO "courseUsers"(
	users, course)
	VALUES ('f51b1a71-a59b-4dee-aab1-3fa56153c12c', '1ea5b1e4-bbf1-488a-aff8-4ffef0b8c726'),
	('f51b1a71-a59b-4dee-aab1-3fa56153c12c', 'f542e89d-54d1-470e-8e6f-c50d029517ae');
	

  INSERT INTO "courseVideo"(
	id, title, url, course)
	VALUES (gen_random_uuid(), 'introduccion  nodejs', 'http:/youtube.com', '1ea5b1e4-bbf1-488a-aff8-4ffef0b8c726'),
	(gen_random_uuid(), 'introduccion react', 'http:/youtube.com', 'f542e89d-54d1-470e-8e6f-c50d029517ae');
	
	
	
	
	