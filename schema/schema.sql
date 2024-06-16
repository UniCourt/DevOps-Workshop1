-- PreRequisites
-- 1. Create a Database
-- 2. Connect to the database

BEGIN;

-- Product Category Table
CREATE TABLE "product_category_table" (
    "product_category_name" VARCHAR(200) PRIMARY KEY,
    "product_category_name_english" VARCHAR(200) NOT NULL
);

-- Products Table
CREATE TABLE "products" (
    "id" VARCHAR(45) NOT NULL PRIMARY KEY,

    "product_category_name" VARCHAR(200) NOT NULL,

    FOREIGN KEY (product_category_name)
    REFERENCES product_category_table("product_category_name") ON DELETE CASCADE
);

-- Order Items Table
CREATE TABLE "order_items" (
    "id" serial NOT NULL PRIMARY KEY,

    "order_id" VARCHAR(45) NOT NULL,

    "product_id" VARCHAR(45) NOT NULL,
    "seller_id" VARCHAR(45) NOT NULL,

    "price" FLOAT NOT NULL,
    "freight_value" FLOAT NOT NULL,

    CONSTRAINT "product_id_fkey"
    FOREIGN KEY (product_id)
    REFERENCES products("id") ON DELETE CASCADE
);

-- Seller Table
CREATE TABLE "seller" (
    "id" VARCHAR(45) PRIMARY KEY,
    "seller_zip_code_prefix" INTEGER,
    "seller_city" VARCHAR(45),
    "seller_state" VARCHAR(45)
);

-- Customer Table
CREATE TABLE "customer" (
    "id" VARCHAR(45) PRIMARY KEY,
    "customer_unique_id" VARCHAR(45),
    "customer_zip_code_prefix" INTEGER,
    "customer_city" VARCHAR(45),
    "customer_state" VARCHAR(45)
);

-- Order Table
CREATE TABLE "order" (
    "id" VARCHAR(45) PRIMARY KEY,
    "customer_id" VARCHAR(45),
    "order_status" VARCHAR(45),
    "order_purchase_timestamp" TIMESTAMP,
    "order_approved_at" TIMESTAMP,
    "order_delivered_carrier_date" TIMESTAMP,
    "order_delivered_customer_date" TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES customer("id")
);

COMMIT;

-- CREATE USER AND GRANT PERMISSIONS
CREATE USER workshop_user  WITH PASSWORD 'workshop_user1';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO workshop_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO workshop_user;
