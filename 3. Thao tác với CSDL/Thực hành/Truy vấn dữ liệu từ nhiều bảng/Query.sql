select Customer.cusNumber, cusName, phone, paymentDate, amount
from Customer
inner join Payment
on Customer.cusNumber = Payment.cusNumber
where city = 'Las Vegas';

select Customer.cusNumber, cusName, orderNumber, status
from Customer
left join `Order`
on Customer.cusNumber = `Order`.cusNumber;

select Customer.cusNumber, cusName, orderNumber, status
from Customer LEFT JOIN `Order`
on Customer.cusNumber = `Order`.cusNumber
where orderNumber is null;