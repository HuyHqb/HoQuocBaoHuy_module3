


delimiter //
create procedure delete_customer_by_id(in id)
begin 

delete from customer c
where c.id == id ;

end 

delimiter ;

delimiter //
create procedure delete_facility_by_id(in id)
begin 

delete from facility f
where f.id == id ;

end 

delimiter ;

