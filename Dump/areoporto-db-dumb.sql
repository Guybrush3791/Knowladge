-- SELECT *, YEAR(date_of_birth)
-- FROM passengers
-- WHERE YEAR(date_of_birth) > 2004

SELECT *, YEAR(date_of_birth), YEAR(NOW())-18
FROM passengers
WHERE YEAR(date_of_birth) > 2004