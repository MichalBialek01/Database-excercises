-- Excercise 1 - Delete every opinion that’s under and equal to 3 stars.
DELETE
FROM opinion
WHERE stars BETWEEN 1 AND 3;
-- Excercise 2 - Show distinct product ean code for products that were bought in last year (2023) showing date of bought

SELECT PRODUCT.ean_code, purchase.date_time
FROM purchase
         INNER JOIN PRODUCT ON PURCHASE.PRODUCT_ID = PRODUCT_ID
WHERE purchase.date_time >= '2023-01-1'
  AND purchase.date_time <= '2023-12-31';
-- Exercise 3 - Show most bought 5 products  - show ean code and quantity of transaction where appears those product’s

SELECT pr.product_internal_code, count(purchase.id) as quantityOfTransaction
from purchase
         inner join public.product pr on pr.id = purchase.product_id
group by pr.product_internal_code
order by quantityOfTransaction desc
limit 5;

-- Exercise 4 - Show all client’s that bought products intended for adults
SELECT c.name, c.surname, c.phone_number
FROM purchase
         INNER JOIN public.customer c on c.id = purchase.customer_id
         INNER JOIN public.product p on p.id = purchase.product_id
WHERE p.adults_only = 'true';
;
-- Exercise 5 - Show at what age are person that bought most often products for adults (Quantity od transaction, not quantity of products)

    SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, c.date_of_birth)) AS age,
           count(p.id) AS sum_of_bought
    FROM purchase
        INNER JOIN public.product p on p.id = purchase.product_id
    INNER JOIN public.customer c on c.id = purchase.customer_id
    where p.adults_only='true'
    group by c.date_of_birth
    order by sum_of_bought desc;

-- Exercise 6 - Input 20% discount for all products form Twitterwire company
-- Selecting
SELECT product_name, product_price FROM producer
 inner join public.product p on producer.id = p.producer_id
    WHERE producer_name = 'Twitterwire';
-- Updating
    UPDATE product
    SET product_price = product_price*0.8
    FROM producer
        WHERE product.producer_id=producer.id
    AND producer_name = 'Twitterwire';
-- 111, 291,489

-- Exercise 7 - Search person that at least one give 1 star opinion
SELECT c.name ,c.surname from opinion
    inner join public.customer c on c.id = opinion.customer_id
        where stars = 1;
-- Exercise 8 - Search company that their products are most selling in our shop

SELECT producer_name, count(product_id) as number_of_sold_products
    FROM purchase
        INNER JOIN public.product p on p.id = purchase.product_id
        INNER JOIN public.producer p2 on p2.id = p.producer_id
    GROUP BY producer_name
    ORDER BY number_of_sold_products desc;

-- Exercise 9 - Show second most expensive product

    SELECT product_name, product_price
    FROM product
    ORDER BY product_price desc
    OFFSET 1
    LIMIT 1;

-- Exercise 10 - Show list of 10 most reviewed products
    SELECT product_name, count(o.product_id) as number_of_opinions
    FROM product
        inner join public.opinion o on product.id = o.product_id
        GROUP BY product_name
        ORDER BY number_of_opinions DESC;

-- Exercise 11 - Advanced - Count earnings for every single month in our company. We can use DATE_TRUNC('month', date_time);

    WITH TMP AS(
        SELECT
            date_trunc('month',pur.date_time) as date_time,
            pur.quantity,
            pr.product_price,
            pur.quantity * pr.product_price AS income_per_product
        FROM purchase pur
            inner join public.product pr on pur.product_id = pr.id
        order by date_time, income_per_product
    )
    SELECT TMP.date_time, sum(tmp.income_per_product) as income
        FROM TMP
    GROUP BY TMP.date_time
    ORDER BY income desc;




















