CREATE DATABASE hw3;
USE hw3;
CREATE TABLE IF NOT EXISTS `personal`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(45),
`last_name` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT

);

INSERT `personal` (`first_name`, `last_name`, `post`, `seniority`, `salary`, `age`) 
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM `personal`;

-- Отсортируйте данные по полю заработная плата (salary) в порядке возрастания;
SELECT *
FROM personal
ORDER BY salary;

-- Отсортируйте данные по полю заработная плата (salary) в порядке убывания;
SELECT *
FROM personal
ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (salary);
SELECT * FROM personal
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst);
SELECT 
post,
SUM(salary) AS "Total salary"
FROM personal
GROUP BY post;

/* 
Найдите кол-во сотрудников с специальностью (post) «Рабочий» в 
возрасте от 24 до 49 лет включительно;
*/ 
SELECT COUNT(*) Number_of_Employees 
FROM personal 
WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- Найдите количество специальностей;
SELECT COUNT(*) Total_post 
FROM(SELECT DISTINCT post 
FROM personal) t;

-- Выведите специальности, у которых средний возраст сотрудников меньше 40 лет;  
SELECT post, AVG(age) as average_age
FROM personal
GROUP BY post
HAVING AVG(age) < 40;


 

