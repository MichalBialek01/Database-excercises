DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS PRODUCER CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS purchase CASCADE;
DROP TABLE IF EXISTS opinion CASCADE;


CREATE TABLE customer
(
    id            INT          NOT NULL PRIMARY KEY,
    email         VARCHAR(255) NOT NULL UNIQUE,
    name          VARCHAR(64)  NOT NULL,
    surname       VARCHAR(64)  NOT NULL,
    date_of_birth DATE         NOT NULL,
    phone_number  varchar(12)  NOT NULL,

    CONSTRAINT phone_number_validation CHECK ( phone_number ~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'),
    CONSTRAINT email_validation CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

CREATE TABLE producer
(
    id                  INT          NOT NULL PRIMARY KEY,
    producer_name       VARCHAR(128) NOT NULL,
    business_identifier VARCHAR(9)   NOT NULL,
    country             VARCHAR(64)  NOT NULL,
    city                VARCHAR(64)  NOT NULL,
    street              VARCHAR(128) NOT NULL,
    building_number     VARCHAR(6)   NOT NULL,
    postal_code         varchar(6)   NOT NULL,

    CONSTRAINT postal_code_validation CHECK ( postal_code ~ '^[0-9]{2}-[0-9]{3}$' ),
    CONSTRAINT business_identifier_validation CHECK ( business_identifier ~ '^[0-9]{9}$')
);

CREATE TABLE product
(
    id                    INT           NOT NULL PRIMARY KEY,
    product_name          VARCHAR(32)   NOT NULL,
    product_internal_code VARCHAR(9)    NOT NULL,
    ean_code              VARCHAR(13)   NOT NULL,
    product_price         NUMERIC(9, 2) NOT NULL,
    adults_only           BOOLEAN       NOT NULL,
    description           TEXT          NOT NULL,
    producer_id           INT           NOT NULL,

    CONSTRAINT product_internal_code_validation CHECK ( product_internal_code ~ '^[0-9]{9}$' ),
    CONSTRAINT ean_code_validation CHECK (ean_code ~ '^\d{8}$|^\d{13}$' ),

    CONSTRAINT fk_producer
        FOREIGN KEY (producer_id)
            REFERENCES producer (id)

);

CREATE TABLE purchase
(
    id          INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL,
    date_time   TIMESTAMP WITH TIME ZONE,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
            REFERENCES customer (id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
            REFERENCES product (id)

);

CREATE TABLE opinion
(
    id          INT      NOT NULL PRIMARY KEY,
    customer_id INT      NOT NULL,
    product_id  INT      NOT NULL,
    stars       SMALLINT NOT NULL,
    comment     VARCHAR  NOT NULL,
    date_time   TIMESTAMP WITH TIME ZONE,
    CONSTRAINT stars_validation CHECK ( stars BETWEEN 1 AND 5),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
            REFERENCES customer (id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
            REFERENCES product (id)
);


