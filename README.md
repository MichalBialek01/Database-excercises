
This repository contains various database-related exercises and projects.

## Project 1 - Shopping Database

### Description
A project focusing on creating and managing a shopping database.

### List of Tables
- **Customer:** ID, EMAIL, NAME, SURNAME, BIRTH_DATE, PHONE_NUMBER
- **Producer:** ID, PRODUCER_NAME, BUSINESS_IDENTIFIER, COUNTRY, CITY, STREET, POSTAL_CODE
- **Product:** ID, PRODUCT_INTERNAL_CODE, EAN_CODE, PRODUCT_PRICE, ADULTS_ONLY, DESCRIPTION, PRODUCER_ID
- **Purchase:** ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, DATE_TIME
- **Opinion:** ID, CUSTOMER_ID, PRODUCT_ID, STARS, COMMENT, DATE_TIME

### Exercises
1. **Create Database:** Create the database and provide mock data.
2. **Delete Opinions:** Remove opinions with 3 stars or less.
3. **Distinct EAN Codes:** Show distinct EAN codes for products bought in the last year.
4. **Most Bought Products:** Display the top 5 most bought products.
5. **Adult Products Buyers:** List clients who bought products for adults.
6. **Buyers of Adult Products by Age:** Show ages of customers who frequently bought adult products.
7. **Discount for Company Products:** Apply a 20% discount for products from a specific company.
8. **One-Star Opinions:** Find customers who gave a 1-star opinion at least once.

### Additional Queries
1. **Top Selling Company:** Identify the company with the highest-selling products.
2. **Second Most Expensive Product:** Display the second most expensive product.
3. **Most Reviewed Products:** List the top 10 most reviewed products.
4. **Monthly Earnings:** Calculate monthly earnings for the company.

## Project 2 - Company Database

### Description
Another database project focusing on managing company-related data.

### Details
This project includes designing, implementing, and querying a database to handle various aspects of company operations.
