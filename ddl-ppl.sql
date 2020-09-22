--Complete your queries below--


--**Create skill table**
create table skill(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
--**Create city table**
create table city(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
-- **Create venue table**
create table venue(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL,
city_id NUMBER(11) NOT NULL,
foreign key(city_id) REFERENCES city(id)
);
--**Create team table**
create table team(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL,
coach VARCHAR(100) NOT NULL,
home_city_id NUMBER(11) NOT NULL,
foreign key(home_city_id) REFERENCES city(id),
captain NUMBER(11) NOT NULL
);
-- **Create player table**
create table player(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL,
skill_id NUMBER(11) NOT NULL,
foreign key(skill_id) REFERENCES skill(id),
team_id NUMBER(11) NOT NULL,
foreign key(team_id)REFERENCES team(id)
);
-- **Create outcome table**
create table outcome(
id NUMBER(11) primary key,
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
foreign key(winner_team_id)REFERENCES team(id),
wickets NUMBER(11),
runs NUMBER(11),
player_of_match NUMBER(11),
foreign key(player_of_match)REFERENCES player(id)
);
-- **Create innings table**
create table innings(
id NUMBER(11) primary key,
innings_number NUMBER(11) NOT NULL,
batting_team_id NUMBER(11) NOT NULL,
foreign key(batting_team_id)REFERENCES team(id)
);
-- **Create game table**
create table game(
id NUMBER(11) primary key,
game_date DATE NOT NULL,
team_id_1 NUMBER(11) NOT NULL,
foreign key(team_id_1)REFERENCES team(id),
team_id_2 NUMBER(11) NOT NULL,
foreign key(team_id_2)REFERENCES team(id),
venue_id NUMBER(11) NOT NULL,
foreign key(venue_id)REFERENCES venue(id),
outcome_id NUMBER(11) NOT NULL,
foreign key(outcome_id)REFERENCES outcome(id),
first_innings_id NUMBER(11),
foreign key(first_innings_id)REFERENCES innings(id),
second_innings_id NUMBER(11),
foreign key(second_innings_id)REFERENCES innings(id)
);
-- **Create umpire table**
create table umpire(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
-- **Create umpire_type table**
create table umpire_type(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
-- **Create game_umpire_type table**
create table game_umpire_type(
id NUMBER(11) primary key,
game_id NUMBER(11) NOT NULL,
CONSTRAINT FK_gameid1 foreign key(game_id) REFERENCES game(id),
umpire_id NUMBER(11) NOT NULL,
foreign key(umpire_id) REFERENCES umpire(id),
umpire_type_id NUMBER(11) NOT NULL,
foreign key(umpire_type_id) REFERENCES umpire_type(id)
);
-- **Create wicket_type table**
create table wicket_type(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
-- **Create delivery table**
create table delivery(
id NUMBER(11) primary key,
innings_id NUMBER(11) NOT NULL,
foreign key(innings_id) REFERENCES innings(id),
over NUMBER(11) NOT NULL,
ball NUMBER(11) NOT NULL,
batsman_id NUMBER(11) NOT NULL,
foreign key(batsman_id) REFERENCES player(id),
bowler_id NUMBER(11) NOT NULL,
foreign key(bowler_id) REFERENCES player(id),
non_striker_id NUMBER(11) NOT NULL,
foreign key(non_striker_id) REFERENCES player(id),
runs NUMBER(11) NOT NULL
);
-- **Create wicket table**
create table wicket(
id NUMBER(11) primary key,
delivery_id NUMBER(11) NOT NULL,
CONSTRAINT FK_deliveryid1 foreign key(delivery_id) REFERENCES delivery(id),
wicket_type_id NUMBER(11) NOT NULL,
foreign key(wicket_type_id) REFERENCES wicket_type(id),
player_id NUMBER(11) NOT NULL,
foreign key(player_id) REFERENCES player(id),
fielder_id NUMBER(11),
foreign key(fielder_id) REFERENCES player(id)
);
-- **Create extratype table**
create table extratype(
id NUMBER(11) primary key,
name VARCHAR(100) NOT NULL
);
-- **Create extradelivery table**
create table extradelivery(
id NUMBER(11) primary key,
delivery_id NUMBER(11) NOT NULL,
CONSTRAINT FK_deliveryid2 foreign key(delivery_id) REFERENCES delivery(id),
extra_type_id NUMBER(11) NOT NULL,
CONSTRAINT FK_extratypeid1 foreign key(extra_type_id) REFERENCES extratype(id),
runs NUMBER(11) NOT NULL
);
-- **Alter column name id**
ALTER TABLE outcome RENAME COLUMN id TO idoutcome;
-- **Alter column name city**
ALTER TABLE city RENAME COLUMN name TO cityname;
-- **Alter column name captain**
ALTER TABLE team RENAME COLUMN captain TO teamcaptain;
-- **Delete column status**
ALTER TABLE outcome
DROP COLUMN status;
-- **Drop table delivery**
ALTER TABLE wicket
DROP CONSTRAINT FK_deliveryid1;

ALTER TABLE extradelivery
DROP CONSTRAINT FK_deliveryid2;

DROP TABLE delivery;
-- **Drop table game**
ALTER TABLE game_umpire_type
DROP CONSTRAINT FK_gameid1;
DROP TABLE game;
-- **Alter column name innings_number**
ALTER TABLE innings RENAME COLUMN innings_number TO innings_numberu;
-- **Alter column name wickets**
ALTER TABLE outcome RENAME COLUMN wickets TO wicketu;
-- **Drop table extratype**
ALTER TABLE extradelivery
DROP CONSTRAINT FK_extratypeid1;
DROP TABLE extratype;