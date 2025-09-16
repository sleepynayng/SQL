### [문제1]
# 각 sale_id에 해당하는 제품 이름,판매 연도, 판매 가격을 출력하시오.
USE PRACTICE;
CREATE TABLE SALES(
	SALE_ID INT,
    PRODUCT_ID INT,
    YEAR INT,
    QUANTITY INT,
    PRICE INT,
    PRIMARY KEY (SALE_ID)
);

INSERT INTO SALES VALUES (1, 100, 2022, 10, 5000), (2, 100, 2023, 12, 5000), (7, 200, 2025,15, 9000);
SELECT * FROM SALES;

CREATE TABLE PRODUCT(
	PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(255)
);

INSERT INTO PRODUCT VALUES (100, "Nokia"), (200, "Apple"), (300, "Samsung");
SELECT * FROM PRODUCT;

# [작성한 답변]
SELECT SALE_ID, PRODUCT_NAME, YEAR, PRICE
FROM SALES 
	INNER JOIN PRODUCT ON SALES.PRODUCT_ID = PRODUCT.PRODUCT_ID;
	

### [문제2]
# 2025년 2월에 100개 이상 주문한 제품 이름과 수량을 조회하시오.
CREATE TABLE products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255)
);

CREATE TABLE ORDERS(
	product_id INT,
    order_date DATE,
    unit INT,
    PRIMARY KEY (product_id, order_date)
);

INSERT INTO PRODUCTS VALUES (1, "MySQL Solutions", "Book"), (2, "Jewels of Stringology", "Book"), (3, "HP", "Laptop"), (4, "Lenovo", "Laptop"), (5, "MySQL Kit", "T-shirt");
INSERT INTO orders (product_id, order_date, unit)
VALUES (1, '2025-02-05', 60),
    (1, '2025-02-10', 70),
    (2, '2025-01-18', 30),
    (2, '2025-02-11', 80),
    (3, '2025-02-17', 2),
    (3, '2025-02-24', 3),
    (4, '2025-03-01', 20),
    (4, '2025-03-04', 30),
    (4, '2025-03-07', 60),
    (5, '2025-02-25', 50),
    (5, '2025-02-27', 50),
    (5, '2025-03-01', 50);


# [작성한 답변]
SELECT Products.product_name, SUM(ORDERS.UNIT) AS sum_unit 
FROM PRODUCTS
	INNER JOIN ORDERS USING (product_id)
WHERE YEAR(order_date) = 2025 AND MONTH(order_date) = 2
GROUP BY products.Product_name
HAVING sum_unit >= 100;


### [문제3]
# 관리자 보다 높은 급여를 받는 직원 이름을 조회하시오.
CREATE TABLE Employee(
	emp_id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    manager_id INT
);

INSERT INTO Employee VALUES 
	(1, 'Joe', 70000, 3),
    (2, 'Henry', 80000, 4),
    (3, 'Sam', 60000, NULL),
    (4, 'Max', 90000, NULL);

# [작성한 답변]
SELECT Employee.name
FROM Employee, Employee AS Manager
WHERE Employee.manager_id = Manager.emp_id AND 
		Employee.salary > Manager.salary;
        
        
DROP TABLE employee;
CREATE TABLE employee
(
    emp_id         INT,
    name           VARCHAR(255),
    salary         INT,
    manager_id     INT,
    PRIMARY KEY(emp_id)
);
INSERT INTO employee (emp_id, name, salary, manager_id)
VALUES (1, 'Mark', 40000, 3),
    (2, 'Alan', 20000, NULL),
    (3, 'Jack', 30000, 2);
SELECT *
FROM employee;
