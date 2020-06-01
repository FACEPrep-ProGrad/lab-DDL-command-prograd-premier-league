--Complete your queries below--

--**Create skill table**
create table SKILL(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);

--**Create city table**
create table CITY(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);

-- **Create venue table**
create table VENUE(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL,
city_id NUMBER(11)NOT NULL,
FOREIGN KEY(city_id)
REFERENCES city(id)
);

--**Create team table**
create table TEAM(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100) NOT NULL,
coach VARCHAR(100) NOT NULL,
home_city_id NUMBER(11),
FOREIGN KEY(home_city_id)
REFERENCES city(id),
captian NUMBER(11)NOT NULL
);

-- **Create player table**
create table PLAYER(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL,
skill_id NUMBER(11) NOT NULL,
FOREIGN KEY(skill_id) REFERENCES skill(id),
team_id NUMBER(11) NOT NULL,
FOREIGN KEY(team_id) REFERENCES team(id)
);

-- **Create outcome table**
create table OUTCOME(
id NUMBER(11)PRIMARY KEY,
status VARCHAR(100)NOT NULL,
winner_team_id NUMBER(11), 
FOREIGN KEY(winner_team_id)REFERENCES team(id),
wickets NUMBER(11),
runs NUMBER(11),
player_of_match NUMBER(11),
FOREIGN KEY(player_of_match)REFERENCES player(id)
);

-- **Create innings table**
create table innings(
id NUMBER(11)PRIMARY KEY,
innings_number NUMBER(11)NOT NULL,
batting_team_id NUMBER(11),
FOREIGN KEY(batting_team_id)REFERENCES team(id)
);

-- **Create game table**
create table game(
id NUMBER(11)PRIMARY KEY,
game_date DATE NOT NULL,
team_id_1 NUMBER(11)NOT NULL,
FOREIGN KEY(team_id_1)REFERENCES team(id),
team_id_2 NUMBER(11)NOT NULL,
FOREIGN KEY(team_id_2)REFERENCES team(id),
venue_id NUMBER(11)NOT NULL,
FOREIGN KEY(venue_id)REFERENCES venue(id),
outcome_id NUMBER(11)NOT NULL,
FOREIGN KEY(outcome_id)REFERENCES outcome(id),
first_innings_id NUMBER(11),
FOREIGN KEY(first_innings_id)REFERENCES innings(id),
second_innings_id NUMBER(11),
FOREIGN KEY(second_innings_id)REFERENCES innings(id)
);

-- **Create umpire table**
create table umpire(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100)NOT NULL
);


-- **Create umpire_type table**
create table umpire_type(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100)NOT NULL
);

-- **Create game_umpire_type table**
create table game_umpire_type(
id NUMBER(11)PRIMARY KEY,
game_id NUMBER(11),
constraint FK_gameid FOREIGN KEY(game_id)REFERENCES game(id),
umpire_id NUMBER(11),
FOREIGN KEY(umpire_id)REFERENCES umpire(id),
umpire_type_id NUMBER(11),
FOREIGN KEY(umpire_type_id)REFERENCES umpire_type(id)
);

-- **Create wicket_type table**
create table wicket_type(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);

-- **Change delivery table**
create table delivery(
id NUMBER(11) PRIMARY KEY,
innings_id NUMBER(11) NOT NULL,
FOREIGN KEY(innings_id) REFERENCES innings(id),
over NUMBER(11) NOT NULL,
ball NUMBER(11) NOT NULL,
batsman_id NUMBER(11) NOT NULL,
FOREIGN KEY(batsman_id) REFERENCES player(id),
bowler_id NUMBER(11) NOT NULL,
FOREIGN KEY(bowler_id) REFERENCES player(id),
non_striker_id NUMBER(11) NOT NULL,
FOREIGN KEY(non_striker_id) REFERENCES player(id),
runs NUMBER(11) NOT NULL
);

-- **Change wicket table**
create table wicket(
id NUMBER(11) primary key,
delivery_id NUMBER(11) NOT NULL,
constraint FK_deliveryid foreign key(delivery_id) REFERENCES delivery(id),
wicket_type_id NUMBER(11) NOT NULL,
FOREIGN KEY(wicket_type_id) REFERENCES wicket_type(id),
player_id NUMBER(11) NOT NULL,
FOREIGN KEY(player_id) REFERENCES player(id),
fielder_id NUMBER(11),
FOREIGN KEY(fielder_id) REFERENCES player(id)
);


-- **Create extratype table**
create table extratype(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);


-- **Create extradelivery table**
create table extradelivery(
id NUMBER(11)PRIMARY KEY,
delivery_id NUMBER(11) NOT NULL,
constraint FK_deliveryid1 FOREIGN KEY(delivery_id) REFERENCES delivery(id),
extra_type_id NUMBER(11) NOT NULL,
constraint FK_extra FOREIGN KEY(extra_type_id) REFERENCES extratype(id),
runs NUMBER(11) NOT NULL
);

-- **Alter column name id**
alter table venue
rename column id TO venueid;


-- **Alter column name city**
alter table city
rename column name TO cityname;

-- **Alter column name caption**
alter table team
rename column captian to Teamleader;

-- **Delete column status**
alter table outcome
drop column status;


-- **Drop table delivery**
alter table wicket
drop constraint FK_deliveryid;

alter table extradelivery
drop constraint FK_deliveryid1;

drop table delivery;

-- **Drop table game**
alter table game_umpire_type
drop constraint FK_gameid;

drop table game;

-- **Alter column name innings_number**
alter table innings
rename column innings_number TO innings_count;


-- **Alter column name wickets**
alter table outcome
rename column wickets TO wik;

-- **Drop table extratype**
alter table extradelivery
drop constraint FK_extra;

drop table extratype;

