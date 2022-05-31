-- Database: airline

-- DROP DATABASE IF EXISTS airline;

CREATE DATABASE airline
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
  
  BEGIN;


create table if not exists public."customers"
(
"cust_ID"  integer NOT NULL, 
"fname" varchar(15) NOT NULL, 
"lname" varchar(15) NOT NULL,
"gender" varchar(10) NOT NULL,
"age" integer NOT NULL,
"contact_add" varchar NOT NULL,
"cust_email" varchar NOT NULL,
"cust_pass" varchar NOT NULL ,
constraint "cust_ID" primary key ("cust_ID")
);

create table if not exists public."db_admin"
(
"admin_ID" integer,
"fname" varchar(15), 
"lname" varchar(15),
"gender" varchar(10),
"age" integer,
"contact_add" varchar,
"admin_email" varchar,
constraint "admin_ID" primary key ("admin_ID")
);


CREATE TABLE IF NOT EXISTS public."reservation"
(
    "res_ID" integer NOT NULL,
    "cust_ID" integer NOT NULL,
    "time_reserve" time NOT NULL,
    "date_reserve" date NOT NULL,
    "payment" money NOT NULL,
    CONSTRAINT "res_ID" PRIMARY KEY ("res_ID"),
    CONSTRAINT "cust_id_fk" FOREIGN KEY ("cust_ID")
    REFERENCES public."customers" ("cust_ID") MATCH SIMPLE
    );


create table if not exists public."tickets"
(
"ticket_ID" integer NOT NULL,
"ticket_num" integer NOT NULL,
"date_flight" date NOT NULL,
"time_flight" time NOT NULL,
"time_land" time NOT NULL,
"destination" varchar NOT NULL,
"trip_type" varchar NOT NULL,
"price" float NOT NULL,
"date_land" date NOT NULL,
"res_ID" integer NOT NULL,
constraint "ticket_ID" primary key ("ticket_ID"),
constraint "reservation_fk" foreign key ("res_ID")
references public."reservation" ("res_ID") MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public."transactions"
(
    "trans_ID" integer NOT NULL,
    "trans_name" text COLLATE pg_catalog."default" NOT NULL,
    "res_ID" integer NOT NULL,
    "schedule_ID" integer NOT NULL,
    "ticket_ID" integer NOT NULL,
    "trans_date" date NOT NULL,
    CONSTRAINT "trans_ID" PRIMARY KEY ("trans_ID"),
    CONSTRAINT "res_fk2" FOREIGN KEY ("res_ID")
    REFERENCES public."reservation" ("res_ID") MATCH SIMPLE
);
alter table reservation
add constraint reservation_2
foreign key ("res_ID") references "transactions" ("trans_ID") deferrable initially deferred;



create table if not exists public."schedule"
(
"schedule_ID" integer NOT NULL,
"admin_ID" integer NOT NULL,
"time_land" time NOT NULL,
"date_flight" date NOT NULL,
"time_depart" time NOT NULL,
"trans_ID" integer NOT NULL,
constraint "schedule_ID" primary key ("schedule_ID"),
constraint "trans1_fk" foreign key ("trans_ID")
references public."transactions" ("trans_ID") MATCH SiMPLE,
constraint "admin1_fk" foreign key ("admin_ID")
references public."db_admin" ("admin_ID") MATCH SiMPLE
);


CREATE TABLE IF NOT EXISTS public."reports"
(
    "report_ID" integer NOT NULL,
    "trans_id" integer NOT NULL,
    "admin_ID" integer NOT NULL,
    "res_ID" integer NOT NULL,
    "report_date" date NOT NULL,
    "No_tickets" integer NOT NULL,
    "income" money NOT NULL,
    CONSTRAINT "report_ID" PRIMARY KEY ("report_ID"),
    CONSTRAINT "Trans_ID_fk" FOREIGN KEY ("trans_id")
    REFERENCES public."transactions" ("trans_ID") MATCH SIMPLE,
   CONSTRAINT "admin_ID_fk" FOREIGN KEY ("admin_ID")
   REFERENCES public."db_admin" ("admin_ID") MATCH SIMPLE
);


