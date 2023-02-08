CREATE PROCEDURE getCusById(IN cusNum int(11))
BEGIN
    SELECT * FROM customers
    WHERE customerNumber = cusNum;
END;

CALL getCusById(175);

CREATE PROCEDURE getCusCountByCity(IN in_city varchar(50),OUT total int)
BEGIN
    SELECT count(customerNumber)
        INTO total
    FROM customers
        WHERE city = in_city;
END;

CALL getCusCountByCity('Lyon',@total);
SELECT @total;

CREATE PROCEDURE setCounter(INOUT counter int,IN inc int)
BEGIN
    SET counter = counter + inc;
END;

SET @counter = 1;
CALL setCounter(@counter,1);
SELECT @counter;
