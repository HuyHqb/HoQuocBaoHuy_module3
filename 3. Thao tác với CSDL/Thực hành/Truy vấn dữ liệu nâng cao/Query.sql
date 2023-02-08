
select productCode, productName, buyprice, quantityInStock from Product
where buyprice > 56.76 and quantityInStock > 10;

SELECT productCode,productName, Product.buyPrice, productDescription
FROM Product
INNER JOIN ProductLine
ON Product.productline = ProductLine.productline
WHERE Product.buyPrice > 56.76 AND Product.buyPrice < 95.59;

select productCode, productName, buyprice, quantityInStock, productVendor, productLine
from Product
where productLine = 'Classic Cars' or productVendor = 'Min Lin Diecast';

select Customer.cusNumber, Customer.cusNumber, phone, paymentDate, amount
from Customer
inner join Payment
on Customer.cusNumber = Payment.cusNumber
where city = 'Las Vegas';

