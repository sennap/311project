-- TABLE STRUCTURE FOR PATS DATABASE
--
-- by Austin Bohn & Senna Parsa
--
--

create table owners(
	id serial primary key,
	first_name character varying(255),
	last_name character varying(255),
	street character varying(255),
	city character varying(255),
	state character varying(255),
	zip integer,
	phone integer,
	email character varying(255),
	active boolean
);
-- should phone be integer or varchar? given that input might include dashes

create table pets(
	id serial primary key,
	name character varying(255),
	animal_id integer,
	owner_id ingteger,
	female boolean,
	date_of_birth date,
	active boolean
);

create table visits(
	id serial primary key,
	pet_id integer,
	date date,
	weight integer,
	overnight_stay boolean default false,  -- added this while doing functions
	total_charge integer
);

create table animals(
	id serial primary key,
	name character varying(255),
	active boolean
);

create table medicines(
	id serial primary key,
	name character varying(255),
	description character varying(255),
	stock_amount integer,
	method character varying(255),
	unit character varying(255),
	vaccine boolean
);

create table medicine_costs(
	id serial primary key,
	medicine_id integer,
	cost_per_unit integer,
	start_date date,
	end_date date
);

create table animal_medicines(
	id serial primary key,
	animal_id integer,
	medicine_id integer,
	recommended_num_of_units integer
);

create table visit_medicines(
	id serial primary key,
	visit_id integer,
	medicine_id integer,
	units_given integer,
	discount integer  -- is this the right type?
);	



create table procedures(
	id serial primary key,
	name character varying(255),
	description character varying(255), --should this be bigger?
	length_of_time integer --right type?
	active boolean
);


create table treatments(
	id serial primary key,
	visit_id integer,
	procedure_id integer,
	successful boolean,
	discount integer
);



create table procedure_costs(
	id serial primary key,
	procedure_id integer,
	cost integer,
	start_date date
	end_date date
);

create table notes(
	id serial primary key,
	notable_type character varying(255), -- right type?
	notable_id integer,
	title character varying(255),
	content character varying(255),
	user_id integer,
	date date
);

create table users(
	id serial primary key,
	first_name character varying(255),
	last_name character varying(255),
	role character varying(255),
	username character varying(255),
	password_digest character varying(255), -- right type or is this a hash or something?
	active boolean
);










