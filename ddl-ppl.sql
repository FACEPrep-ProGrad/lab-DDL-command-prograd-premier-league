--Complete your queries below--


--**Create skill table**

create table skill(
id number(11) primary key,
name varchar(50) not null
);

--**Create city table**
create table city(
id number(11) primary key,
name varchar(50) not null
);


-- **Create venue table**
create table venue(
id number(11) primary key,
name varchar(100) not null,
city_id number(11) not null
);


--**Create team table**
create table teaam(
id number(11) primary key,
name varchar(100) not null,
coach varchar(100) not null,
home_city_id number(11) not null,
captain number(11) not null
);


-- **Create player table**
create table player(

id number(11) primary key,
name varchar(100) not null,
country varchar(100) not null,
skill_id number(11) not null,
team_id number(11) not null
);
-- **Create outcome table**
create table outcome(
id number(11) primary key,
status varchar(100) not null,
winner_team_id number(11),
wickets number(11),
runs number(11),
player_of_match number(11)
);
-- **Create innings table**
create table innings(
id number(11) primary key,
innings_number number(11) not null,
batting_team_id number(11) not null
);

-- **Create game table**
create table game(
id number(11) primary key,
game_date date not null,
team_id_1 number(11) not null,
team_id_2 number(11) not null,
venue_id number(11) not null,
outcome_id number(11) not null,
first_innings_id number(11),
second_innings_id number(11)
);

-- **Create umpire table**

create table umpire(
id number(11) primary key,
name varchar(100) not null
);
-- **Create umpire_type table**
create table umpire_type(
id number(11) primary key,
type varchar(100) not null
);

-- **Create game_umpire_type table**
create table gae_umpire_type(
id number(11) primary key,
game_id number(11) not null,
umpire_id number(11) not null,
umpire_type_id number(11) not null
);
-- **Create wicket_type table**
create table wicket_type(
id number(11) primary key,
name varchar(100) not null
);

-- **Change delivery table**

create table delivery(
id number(11) primary key,
innings_id number(11) not null,
over number(11) not null,
ball number(11) not null,
batsman_id number(11) not null,
baller_id number(11) not null,
non_striker_id number(11) not null, 
runs number(11) not null
);

-- **Change wicket table**

create table wicket(
id number(11) primary key,
delivery_id number(11) not null,
wicket_type_id number(11) not null,
player_id number(11) not null,
fielder_id number(11)
);
-- **Create extratype table**
create table extratype(
id number(11) primary key,
name varchar(100) not null
);

-- **Create extradelivery table**

create table extradelivery(
id number(11) primary key,
delivery_id number(11) not null,
extratype_id number(11) not null,
runs number(11) not null
);

-- **Alter column name id**

alter table player
rename column id to num;

-- **Alter column name city**

alter table city
rename to metrocity;

-- **Alter column name caption**

alter table team 
rename column captain to cap;

-- **Delete column status**

alter table outcome
drop column status;

-- **Drop table delivery**

drop table delivery cascade constraints;

-- **Drop table game**

drop table game cascade constraints;

-- **Alter column name innings_number**

alter table innings 
rename column innings_number to innings_num;

-- **Alter column name wickets**

alter table outcome
rename column wickets to wicket;

-- **Drop table extratype**

drop table extratype cascade constraints;
