-- # Write your MySQL query statement below
SELECT A.NAME AS COUNTRY
FROM COUNTRY A
INNER JOIN PERSON B
ON A.COUNTRY_CODE = SUBSTRING(B.PHONE_NUMBER,1,3)
INNER JOIN (SELECT CALLER_ID AS ID, DURATION FROM CALLS
            UNION ALL
            SELECT CALLEE_ID AS ID, DURATION FROM CALLS) C
ON B.ID = C.ID
GROUP BY A.NAME
HAVING AVG(C.DURATION) > (SELECT AVG(DURATION)
                          FROM CALLS);