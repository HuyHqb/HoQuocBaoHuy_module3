
delimiter //
create procedure delete_service_by_id(in id)
begin 

delete from service s
where s.id == id ;

end 

delimiter ;