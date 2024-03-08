.read data.sql


CREATE TABLE average_prices AS
  SELECT category AS category,AVG(MSRP) AS average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store,item,min(price) FROM inventory GROUP BY item; 


CREATE TABLE shopping_list AS
  SELECT item,store FROM lowest_prices
  WHERE item="GameStation" or item="uPhone" or item="wBook"; 


CREATE TABLE total_bandwidth AS
  SELECT sum( Mbs) FROM stores,shopping_list
  WHERE stores.store=shopping_list.store
      ;

