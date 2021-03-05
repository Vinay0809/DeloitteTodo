DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Tasks;


CREATE TABLE Users (
  userid INT AUTO_INCREMENT  PRIMARY KEY,
  username VARCHAR(250) NOT NULL,
  password VARCHAR(250) NOT NULL
);
 
INSERT INTO Users (username, password) VALUES
  ('test', 'pwd123'),
  ('Vini', 'Vinii123'),
  ('foo', 'Foo123');
  
  CREATE TABLE Tasks (
  id INT AUTO_INCREMENT  PRIMARY KEY,
  task_description VARCHAR(250) NOT NULL,
  datetime SMALLDATETIME NOT NULL,
  completed BIT DEFAULT 1,
  userid INT,
   foreign key (userid) references Users(userid)
);

INSERT INTO Tasks (task_description, datetime, userid) VALUES
  ('Task1', '2021-01-30 11:05:00' ,'2'),
  ('Task2', '2021-01-30 15:08:00','2'),
  ('Task3', '2021-02-28 23:56:50','1'),
  ('Task4','2021-02-28 14:34:21', '3'),
  ('Task5','2021-03-04 14:34:21', '3');