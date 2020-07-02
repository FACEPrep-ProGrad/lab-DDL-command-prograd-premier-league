--Complete your queries below--


--**Create skill table**
CREATE TABLE skill(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);


--**Create city table**

CREATE TABLE city(
id NUMBER(11) PRIMARY KEY , 
name VARCHAR(100) NOT NULL
);

-- **Create venue table**
CREATE TABLE venue(
id NUMBER(11) PRIMARY KEY , 
name VARCHAR(100) NOT NULL,
city_id NUMBER(11) NOT NULL,
CONSTRAINT venue_city_id_fk
FOREIGN KEY(city_id) REFERENCES city(id)
ON DELETE CASCADE
);


--**Create team table**

CREATE TABLE team(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
coach VARCHAR(100) NOT NULL,
home_city_id NUMBER(11) NOT NULL,
captain NUMBER(11),
CONSTRAINT team_home_city_id_fk
FOREIGN KEY(home_city_id) REFERENCES city(id)
ON DELETE CASCADE
);

-- **Create player table**
CREATE TABLE player (
    id        NUMBER(11) PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    country   VARCHAR(100) NOT NULL,
    skill_id  NUMBER(11) NOT NULL,
    team_id   NUMBER(11) NOT NULL,
    CONSTRAINT player_skill_id_fk FOREIGN KEY ( skill_id )
        REFERENCES skill ( id )
            ON DELETE CASCADE,
    CONSTRAINT player_team_id_fk FOREIGN KEY ( team_id )
        REFERENCES team ( id )
            ON DELETE CASCADE
);
-- **Create outcome table**
CREATE TABLE outcome(
id NUMBER(11) PRIMARY KEY,
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
wickets NUMBER(11),
runs NUMBER(11),
player_of_match NUMBER(11),
CONSTRAINT outcome_winner_eam_id_fk
FOREIGN KEY (winner_team_id) REFERENCES team(id)
ON DELETE CASCADE,
CONSTRAINT outcome_player_of_match_fk
FOREIGN KEY (player_of_match) REFERENCES player(id)
ON DELETE CASCADE
);
-- **Create innings table**
CREATE TABLE innings(
id NUMBER(11) PRIMARY KEY,
innings_number NUMBER(11) NOT NULL,
batting_team_id NUMBER(11) NOT NULL,
CONSTRAINT innings_batting_team_id
FOREIGN KEY (batting_team_id) REFERENCES team(id)
ON DELETE CASCADE
);
-- **Create game table**
CREATE TABLE game(
id NUMBER(11) PRIMARY KEY,
game_date DATE NOT NULL,
team_id_1 NUMBER(11) NOT NULL,
team_id_2 NUMBER(11) NOT NULL,
venue_id NUMBER(11) NOT NULL,
outcome_id NUMBER(11) NOT NULL,
first_innings_id NUMBER(11),
second_innings_id NUMBER(11),
CONSTRAINT game_team_id_1_fk
FOREIGN KEY(team_id_1) REFERENCES team(id)
ON DELETE CASCADE,
CONSTRAINT game_team_id_2_fk 
FOREIGN KEY(team_id_2) REFERENCES team(id)
ON DELETE CASCADE,
CONSTRAINT game_venue_id_fk 
FOREIGN KEY(venue_id) REFERENCES venue(id)
ON DELETE CASCADE,
CONSTRAINT game_outcome_id_fk
FOREIGN KEY (outcome_id) REFERENCES outcome(id)
ON DELETE CASCADE,
CONSTRAINT game_first_innings_id_fk
FOREIGN KEY(first_innings_id) REFERENCES innings(id)
ON DELETE CASCADE,
CONSTRAINT game_second_innings_id_fk
FOREIGN KEY(second_innings_id) REFERENCES innings(id)
ON DELETE CASCADE

);
-- **Create umpire table**
CREATE TABLE umpire(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);
-- **Create umpire_type table**
CREATE TABLE umpire_type(
id NUMBER(11) PRIMARY KEY,
type VARCHAR(100) NOT NULL
);
-- **Create game_umpire_type table**
CREATE TABLE game_umpire_type(
id NUMBER(11) PRIMARY KEY,
game_id NUMBER(11) NOT NULL,
umpire_id NUMBER(11) NOT NULL,
umpire_type_id NUMBER(11) NOT NULL,
CONSTRAINT game_id_fk
FOREIGN KEY(game_id) REFERENCES game(id)
ON DELETE CASCADE,
CONSTRAINT umpire_id_fk
FOREIGN KEY(umpire_id) REFERENCES umpire(id)
ON DELETE CASCADE,
CONSTRAINT umpire_type_id
FOREIGN KEY (umpire_type_id) REFERENCES umpire_type(id)
ON DELETE CASCADE
);
-- **Create wicket_type table**
CREATE TABLE wicket_type(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);
-- **Change delivery table**
CREATE TABLE delivery(
id NUMBER(11) PRIMARY KEY,
innings_id NUMBER(11) NOT NULL,
over NUMBER(11) NOT NULL,
ball NUMBER(11) NOT NULL,
batsman_id NUMBER(11) NOT NULL,
baller_id NUMBER(11) NOT NULL,
non_striker_id NUMBER(11) NOT NULL, 
runs NUMBER(11) NOT NULL,
CONSTRAINT delivery_innings_id_fk
FOREIGN KEY(innings_id) REFERENCES innings(id)
ON DELETE CASCADE,
CONSTRAINT delivery_batsman_id_fk
FOREIGN KEY(batsman_id) REFERENCES player(id)
ON DELETE CASCADE,
CONSTRAINT delivery_baller_id_fk
FOREIGN KEY(baller_id) REFERENCES player(id)
ON DELETE CASCADE,
CONSTRAINT  delivery_non_striker_id_fk
FOREIGN KEY(non_striker_id) REFERENCES player(id)
ON DELETE CASCADE
);
-- **Change wicket table**
CREATE TABLE wicket(
id NUMBER(11) PRIMARY KEY,
delivery_id NUMBER(11) NOT NULL,
wicket_type_id NUMBER(11) NOT NULL,
player_id NUMBER(11) NOT NULL,
fielder_id NUMBER(11),
CONSTRAINT wicket_delivery_id_fk
FOREIGN KEY(delivery_id) REFERENCES delivery(id)
ON DELETE CASCADE,
CONSTRAINT wicket_wicket_type_id_fk
FOREIGN KEY(wicket_type_id) REFERENCES wicket_type(id)
ON DELETE CASCADE,
CONSTRAINT wicket_player_id_fk
FOREIGN KEY(player_id) REFERENCES player(id)
ON DELETE CASCADE,
CONSTRAINT wicket_fielder_id_fk
FOREIGN KEY(fielder_id) REFERENCES player(id)
ON DELETE CASCADE
);
-- **Create extratype table**
CREATE TABLE extratype(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);
-- **Create extradelivery table**
CREATE TABLE extradelivery(
id NUMBER(11) PRIMARY KEY,
delivery_id NUMBER(11) NOT NULL,
extratype_id NUMBER(11) NOT NULL,
runs NUMBER(11) NOT NULL,
CONSTRAINT extradelivery_delivery_id_fk
FOREIGN KEY(delivery_id) REFERENCES delivery(id)
ON DELETE CASCADE,
CONSTRAINT extradelivery_extratype_id_fk
FOREIGN KEY(extratype_id) REFERENCES extratype(id)
ON DELETE CASCADE
);
-- **Alter column name id**
ALTER TABLE player
RENAME COLUMN id TO num;
-- **Alter column name city**
ALTER TABLE city
RENAME TO metrocity;
-- **Alter column name caption**
ALTER TABLE team
RENAME COLUMN captain to kaptan; 
-- **Delete column status**
ALTER TABLE outcome
Drop COLUMN status;
-- **Drop table delivery**
DROP TABLE delivery CASCADE CONSTRAINTS;
-- **Drop table game**
DROP TABLE game CASCADE CONSTRAINTS;
-- **Alter column name innings_number**
ALTER TABLE innings
RENAME COLUMN innings_number TO innings_num;
-- **Alter column name wickets**
ALTER TABLE outcome
RENAME COLUMN wickets TO wicket;
-- **Drop table extratype**
DROP TABLE extratype CASCADE CONSTRAINTS;

