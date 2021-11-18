use universities;

-- Creating Scheduler 
drop table if exists messages;
create table messages (message varchar(320));
truncate messages;

set global event_scheduler = ON;
show variables like "event_scheduler";

Delimiter $$
create event refresh_university_scores_quarterly
on schedule every 3 month
starts current_timestamp
ends current_timestamp + interval 3 month
do
	begin
		insert into messages select concat('evet:',NOW());
        call refresh_university_scores_quarterly();
	END $$
Delimiter ;

select * from messages;
show events;
drop event if exists refresh_university_scores_quarterly;