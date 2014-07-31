CREATE TABLE user (
        username char(30) NOT NULL,
        password char(60) NOT NULL,
        email char(40) UNIQUE NOT NULL,
        create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        goals INT,
        goals_conceded INT,
        wins INT,
        defeats INT,
                tournament_wins INT,
                tournament_participations INT,
        PRIMARY KEY (username)
);

CREATE TABLE tournament (
        name CHAR(30) NOT NULL,
        leader CHAR(30) NOT NULL,
        start_date DATETIME,
        end_date DATETIME,
        create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        description CHAR(255),
        rounds INT,
        venue CHAR(30),
        deadline DATETIME,
        PRIMARY KEY (name),
        FOREIGN KEY (leader) REFERENCES user(username) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE team (
        name CHAR(30) NOT NULL,
        tag CHAR(4) NOT NULL,
        leader CHAR(30) NOT NULL,
        create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        goals INT,
        goals_conceded INT,
        wins INT,
        defeats INT,
                tournament_wins INT,
                tournament_participations INT,
        PRIMARY KEY (name),
        FOREIGN KEY (leader) REFERENCES user(username) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE game (
		match_id INT NOT NULL auto_increment,
        tournament CHAR(30) NOT NULL,
        round_nr INT NOT NULL,
        game_nr INT NOT NULL,
        team_home CHAR(30),
        team_away CHAR(30),
        goals_home TINYINT,
        goals_away TINYINT,
		played TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (match_id),
        FOREIGN KEY (tournament) REFERENCES tournament(name) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (team_home) REFERENCES team(name) ON DELETE RESTRICT ON UPDATE CASCADE,
        FOREIGN KEY (team_away) REFERENCES team(name) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE team_tournament (
        team CHAR(30) NOT NULL,
        tournament CHAR(30) NOT NULL,
        goals INT,
        goals_conceded INT,
        wins INT,
        defeats INT,
        enter_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (team, tournament),
        FOREIGN KEY (team) REFERENCES team(name) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (tournament) REFERENCES tournament(name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user_team (
        user CHAR(30) NOT NULL,
        team CHAR(30) NOT NULL,
        enter_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (user, team),
        FOREIGN KEY (user) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (team) REFERENCES team(name) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO user (username, password, email, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Maik", "$2a$10$mAoleFV433Ufc/bUTfamxewAiVFWbPweKKn3s5SffhpzWUuclNiFW", "maik@kms.de", 0, 0, 0, 0, 0, 0);
          
INSERT INTO user (username, password, email, goals, goals_conceded, 
			wins, defeats, tournament_wins, tournament_participations)
	  VALUES ("Malte", "$2a$10$mAoleFV433Ufc/bUTfamxewAiVFWbPweKKn3s5SffhpzWUuclNiFW", "malte@kms.de", 0, 0, 0, 0, 0, 0);

INSERT INTO user (username, password, email, goals, goals_conceded, 
			wins, defeats, tournament_wins, tournament_participations)
	  VALUES ("Alex", "$2a$10$mAoleFV433Ufc/bUTfamxewAiVFWbPweKKn3s5SffhpzWUuclNiFW", "alex@kms.de", 0, 0, 0, 0, 0, 0);
	  
INSERT INTO user (username, password, email, goals, goals_conceded, 
			wins, defeats, tournament_wins, tournament_participations)
	  VALUES ("Louis", "$2a$10$mAoleFV433Ufc/bUTfamxewAiVFWbPweKKn3s5SffhpzWUuclNiFW", "louis@kms.de", 0, 0, 0, 0, 0, 0);	 

INSERT INTO user (username, password, email, goals, goals_conceded, 
			wins, defeats, tournament_wins, tournament_participations)
	  VALUES ("Lorenz", "$2a$10$mAoleFV433Ufc/bUTfamxewAiVFWbPweKKn3s5SffhpzWUuclNiFW", "lorenz@kms.de", 0, 0, 0, 0, 0, 0);
	  
	  
	  
	  
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Maik Malte", "TMaMa", "Maik", 0, 0, 0, 0, 0, 0);

INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Maik Alex", "TMaAl", "Maik", 0, 0, 0, 0, 0, 0);

INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Maik Louis", "TMaLou", "Maik", 0, 0, 0, 0, 0, 0);

INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Maik Lorenz", "TMaLo", "Maik", 0, 0, 0, 0, 0, 0);
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Malte Alex", "TMaAl", "Malte", 0, 0, 0, 0, 0, 0);         
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Malte Louis", "TMaLou", "Malte", 0, 0, 0, 0, 0, 0);   
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Malte Lorenz", "TMaLo", "Malte", 0, 0, 0, 0, 0, 0);  
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Alex Louis", "TAlLou", "Alex", 0, 0, 0, 0, 0, 0);  
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Alex Lorenz", "TAlLo", "Alex", 0, 0, 0, 0, 0, 0);            
          
INSERT INTO team (name, tag, leader, goals, goals_conceded, 
					wins, defeats, tournament_wins, tournament_participations)
          VALUES ("Team Louis Lorenz", "TLouLo", "Louis", 0, 0, 0, 0, 0, 0);
          
          
          
          
INSERT INTO user_team (user, team)
		  VALUES ("Maik", "Team Maik Malte");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Maik", "Team Maik Alex");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Maik", "Team Maik Louis");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Maik", "Team Maik Lorenz");

INSERT INTO user_team (user, team)
		  VALUES ("Malte", "Team Maik Malte");

INSERT INTO user_team (user, team)
		  VALUES ("Malte", "Team Malte Alex");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Malte", "Team Malte Louis");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Malte", "Team Malte Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Alex", "Team Alex Louis");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Alex", "Team Alex Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Alex", "Team Maik Alex");		  

INSERT INTO user_team (user, team)
		  VALUES ("Alex", "Team Malte Alex");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Louis", "Team Maik Louis");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Louis", "Team Malte Louis");
		  
INSERT INTO user_team (user, team)
		  VALUES ("Louis", "Team Louis Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Louis", "Team Alex Louis");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Lorenz", "Team Maik Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Lorenz", "Team Malte Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Lorenz", "Team Alex Lorenz");		  
		  
INSERT INTO user_team (user, team)
		  VALUES ("Lorenz", "Team Louis Lorenz");		  
		  		  
		  		  
		  		  
		  		  
		  		  
		  		  		  		  		  		  		  		  
INSERT INTO tournament (name, leader, start_date, end_date, 
					    rounds, venue, deadline, description)
		  VALUES ("GDIS - alle", "Maik", "2014-01-01", "2014-07-18", 4, "Kicko Eingango", "2014-01-01", "Jeden Mittag nach dem Essen KICKO! Und vielleicht gibts auch noch den ein oder anderen Kaffo =)");




INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Maik Malte", "GDIS - alle", 150, 57, 15, 0);

INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Maik Alex", "GDIS - alle", 160, 68, 16, 0);
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Malte Alex", "GDIS - alle", 133, 107, 10, 5);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Maik Lorenz", "GDIS - alle", 119, 115, 7, 7);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Malte Louis", "GDIS - alle", 120, 138, 7, 9);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Maik Louis", "GDIS - alle", 130, 119, 6, 9);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Alex Louis", "GDIS - alle", 93, 115, 5, 8);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Malte Lorenz", "GDIS - alle", 106, 152, 5, 11);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Alex Lorenz", "GDIS - alle", 92, 140, 3, 12);		  
		  
INSERT INTO team_tournament (team, tournament, goals, goals_conceded, 
					wins, defeats) 
		  VALUES ("Team Louis Lorenz", "GDIS - alle", 52, 144, 1, 14);