CREATE TABLE "customers" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar UNIQUE,
  "phone" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "products" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" text,
  "price" decimal,
  "stock_quantity" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "salespeople" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar UNIQUE,
  "phone" varchar,
  "hire_date" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "sales" (
  "id" integer PRIMARY KEY,
  "sale_date" timestamp,
  "customer_id" integer,
  "salesperson_id" integer,
  "product_id" integer,
  "quantity" integer,
  "total_price" decimal,
  "created_at" timestamp,
  "updated_at" timestamp
);

ALTER TABLE "sales" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "sales" ADD FOREIGN KEY ("salesperson_id") REFERENCES "salespeople" ("id");

ALTER TABLE "sales" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
