use classicmodels;

DELIMITER //
CREATE PROCEDURE findAllCustomer()
BEGIN
    SELECT *
        FROM customers;
END;
DELIMITER ;

CALL findAllCustomer();
