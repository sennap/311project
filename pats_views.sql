-- VIEWS FOR PATS DATABASE
--
-- by Austin Bohn & Senna Parsa
--
-- View that joins owners, pets, and visits together

CREATE VIEW  owners_view AS
SELECT v.pet_id, p.name, a.name AS "animal_name", v.date, v.weight, p.female, p.date_of_birth, p.active, v.overnight_stay, v.total_charge, p.name, o.first_name, o.last_name, o.street, o.city, o.state, o.zip, o.phone, o.email, o.active
FROM visits v lEFT JOIN (pets p JOIN animals a using(animal_id)) using(pet_id) JOIN owners o using(owner_id);


--View that connects information from the medicine, animal, and cost tables together

CREATE VIEW medicine_views AS
SELECT  a.name as "animal", a.active, m.name AS "medicine_name", m.description, m.stock_amount, m.method, m.unit, m.vaccine, mc.current_cost_per_unit AS "current_cost" 
FROM animals a JOIN animal_medicines am using(animal_id) JOIN medicines m using (medicine_id) JOIN medicine_cost mc using (medicine_id);_ 
--
