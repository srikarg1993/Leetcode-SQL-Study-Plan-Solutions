-- # Write your MySQL query statement below
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
          SELECT SALARY as getNthHighestSalary
          FROM (
            SELECT SALARY, DENSE_RANK() OVER(ORDER BY salary DESC) as SAL_RANK
            FROM EMPLOYEE) A
          WHERE SAL_RANK = N
          LIMIT 1  
  );
END