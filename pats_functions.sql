-- FUNCTIONS AND TRIGGERS FOR PATS DATABASE
--
-- by Austin Bohn & Senna Parsa
--
--

create or replace function set_med_costs_end_date() returns trigger as $$
	declare
		mid integer;  -- the id of the medical_cost
		
	begin
		mid = (select id from medicine_costs where end_date is null);
		update medicine_costs set end_date = current_date where id=mid;
	end;
	$$ language plpgsql;
	
	
-- trigger to update close the currently open medicine costs before adding
--		a new one	
create trigger new_med_cost
	before insert on medicine_costs
	execute set_med_costs_end_date();
	
	
create or replace function reduce_med_stock() returns trigger as $$
	declare
		vid integer; -- id of the visit_medicine most recently inserted
		mid integer; -- medicine id
		amt integer; -- units used at the visit
	begin
		vid = (select id from visit_medicine order by id desc limit 1);
		mid = (select medicine_id from visit_medicine where id = vid);
		amt = (select units_given from visit_medicine where id = vid);
		update medicines set stock_amount = (stock_amount - amt) where id = mid;
	end
	$$ language plpgsql;
	
	
	
create trigger adjust_inventory
	after insert on visit_medicine
	execute reduce_med_stock();
	
	


create or replace function determine_overnight() returns trigger as $$
	declare
		pid integer;  --procedure id
		vid integer;  --visit id
		tid integer;  --treatment id
		lot integer;  --length of time
		
	begin
		pid = (select)
		if lot >= 12 then
			update visits set overnight_stay = true where id = vid;
		end if;
	end
	$$ language plpgsql;




create trigger if_overnight
	after insert on procedures
	execute determine_overnight();	
	
	
	
	