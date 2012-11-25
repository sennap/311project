-- CONSTRAINTS FOR PATS DATABASE
--
-- by Austin Bohn & Senna Parsa
--
--

alter table pets add constraint foreign_animal foreign key (animal_id) references animals(id);
alter table pets add constraint foreign_owner foreign key (owner_id) references owners(id);
alter table visits add constraint foreign_pet foreign key (pet_id) references pets(id);
alter table medicine_costs add constraint foreign_medicine foreign key (medicine_id) references medicines(id);
alter table animal_medicines add constraint foreign_animal foreign key (animal_id) references animals(id);
alter table animal_medicines add constraint foreign_medicine foreign key (medicine_id) references medicines(id);
alter table visit_medicines add constraint foreign_visit foreign key (visit_id) references visits(id);
alter table visit_medicines add constraint foreign_medicine foreign key (medicine_id) references medicines(id);
alter table treatments add constraint foreign_visit foreign key (visit_id) references visits(id);
alter table treatments add constraint foreign_procedure foreign key (procedure_id) references procedures(id);
alter table procedure_costs add constraint foreign_procedure foreign key (procedure_id) references procedures(id);


