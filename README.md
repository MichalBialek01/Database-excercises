# Workshop-4-Databases - Shopping Database Project Repository

This repository is dedicated to tasks related to the database. It includes various database exercises and projects. For basic information about databases, please refer to the PDF file available at [Basic Database Information](https://github.com/MichalBialek01/Workshop-4---Database-/blob/main/Bazy_danych.pdf).

## List of Tables

### Customer
- **ID**
- **EMAIL**
- **NAME**
- **SURNAME**
- **BIRTH_DATE**
- **PHONE_NUMBER**

### Producer
- **ID**
- **PRODUCER_NAME**
- **BUSINESS_IDENTIFIER**
- **COUNTRY**
- **CITY**
- **STREET**
- **POSTAL_CODE**

### Product
- **ID**
- **PRODUCT_INTERNAL_CODE**
- **EAN_CODE**
- **PRODUCT_PRICE**
- **ADULTS_ONLY**
- **DESCRIPTION**
- **PRODUCER_ID**

### Purchase
- **ID**
- **CUSTOMER_ID**
- **PRODUCT_ID**
- **QUANTITY**
- **DATE_TIME**

### Opinion
- **ID**
- **CUSTOMER_ID**
- **PRODUCT_ID**
- **STARS**
- **COMMENT**
- **DATE_TIME**

## Exercises

1. **Create Database**  
   Create the presented database and provide mock data (for instance by using [Mockaroo](http://mockaroo.com)).

2. **Delete Opinions**  
   Delete every opinion that's under and equal to 3 stars.

3. **Distinct EAN Codes**  
   Show distinct product EAN codes for products that were bought in the last year (2022).

4. **Most Bought Products**  
   Show the most bought 5 products - show EAN code and quantity of transactions where these products appear.

5. **Adult Products Buyers**  
   Show all clients that bought products intended for adults.

6. **Buyers of Adult Products by Age**  
   Show at what age are persons that bought most often products for adults.

7. **Discount for Company Products**  
   Apply a 20% discount for all products from XXX company.

8. **One-Star Opinions**  
   Search for a person that at least once gave a 1-star opinion.

### Additional Queries

1. **Top Selling Company**  
   Search for the company whose products are most selling in our shop.

2. **Second Most Expensive Product**  
   Show the second most expensive product (we can use OFFSET).

3. **Most Reviewed Products**  
   Show a list of the 10 most reviewed products.

4. **Monthly Earnings**  
   Count earnings for every single month in our company. We can use DATE_TRUNC('month', date_time).
