-- Задание 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE DATABASE IF NOT EXISTS home_task_2;		-- Создаем БД с именем home_task_2

USE home_task_2; -- Подключаемся к конкретной БД

-- Cоздаём таблицу “sales”
CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE,
  count_product INT UNSIGNED NOT NULL
);

-- Заполняем таблицу “sales”
INSERT INTO sales (order_date, count_product) VALUES
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
  
  SELECT * FROM sales;
  
  
  /* Задание 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
		меньше 100 - Маленький заказ
		от 100 до 300 - Средний заказ
		больше 300 - Большой заказ */
        
SELECT
	id AS "id заказа",
    IF(count_product < 100, "Маленький заказ", 
		IF(count_product BETWEEN 100 AND 300, "Средний заказ", "Больщой заказ"))
	AS "Тип заказа"
FROM sales;


/* Задание 3.  Создайте таблицу “orders”, заполните ее значениями.
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled» */

-- Cоздаём таблицу “orders”
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(45) NOT NULL,
  amount DECIMAL(5,2) NOT NULL,
  order_status VARCHAR(45) NOT NULL
);

-- Заполняем таблицу “orders”
INSERT INTO orders (employee_id, amount, order_status) VALUES
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');
  
  SELECT * FROM orders;

-- выводим требуемый столбец
SELECT employee_id, amount, order_status, 
CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    ELSE "Order is cancelled"
END AS full_order_status
FROM orders;


-- Задание 4. Чем 0 отличается от NULL?
/*Ответов на данный вопрос можно найти на просторах интернета достаточно много.
Один из таких ответов представлен в Википедии. Циатата приведена ниже.
"NULL в СУБД — специальное значение (псевдозначение), которое может быть записано в поле таблицы базы данных (БД). 
NULL соответствует понятию «пустое поле», то есть «поле, не содержащее никакого значения». 
Введено для того, чтобы различать в полях БД пустые (визуально не отображаемые) значения (например, строку нулевой длины)
 и отсутствующие значения (когда в поле не записано вообще никакого значения, даже пустого).
NULL означает отсутствие, неизвестность информации. Значение NULL не является значением в полном смысле слова: 
по определению оно означает отсутствие значения и может иметь тип NULL или иметь любой другой тип 
(CREATE TABLE new_tab AS (SELECT NULL) — специальный тип null, CREATE TABLE new_table AS (SELECT 10+NULL) — тип integer). 
Поэтому NULL не равно ни логическому значению FALSE, ни пустой строке, ни нулю. 
При сравнении NULL с любым значением будет получен результат NULL, а не FALSE и не 0. Более того, NULL не равно NULL!" */