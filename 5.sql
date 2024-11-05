-- Active: 1730186965981@@127.0.0.1@3306@zkx
-- 创建 user 表
CREATE DATABASE zkx;
USE zkx;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    sex ENUM('Male', 'Female'),
    age INT,
    phone VARCHAR(15)
);

-- 插入数据
INSERT INTO user (name, sex, age, phone) VALUES 
('John Doe', 'Male', 25, '123-456-7890'),
('Jane Smith', 'Female', 31, '987-654-3210'),
('Bob Johnson', 'Male', 22, '555-123-4567');

SELECT *FROM user;

SELECT *FROM user WHERE age BETWEEN 20 AND 30;

INSERT INTO user(name,sex,age,phone) VALUES
('KEXUAN ZHOU','Male',19,'18931510750'),
('Jokersun','Male',18,'18988888888'),
('YURONG ZHOU','Female',17,'18440933786'),
('HANRUN ZHOU','Female',20,'18931515555');

UPDATE user
SET id = id - 16  -- 将 20 减去 16 得到 4
WHERE id >= 20;

SELECT *FROM user;

SELECT *FROM user
WHERE age BETWEEN 20 AND 30 AND name LIKE '%ZHOU%'
ORDER BY age DESC;

SELECT AVG(age) FROM user;

/*ON DELETE CASCADE: 删除主表中的记录时，会自动删除引用这些记录的外键行。
ON UPDATE CASCADE: 更新主表中的主键时，会自动更新所有引用这些主键的外键行。
示例*/

CREATE TABLE team(
    id INT AUTO_INCREMENT PRIMARY KEY,
    teamName VARCHAR(100)
);
CREATE TABLE score(
    id INT AUTO_INCREMENT PRIMARY KEY,
    teamid INT,
    userid INT,
    score INT,
    FOREIGN KEY(teamid) REFERENCES team(id),
    FOREIGN KEY(userid) REFERENCES user(id)
);

INSERT INTO team (teamName) VALUES ('ECNU');

INSERT INTO score (teamid, userid, score) VALUES 
(1, 1, 10), 
(1, 2, 20),
(1, 3, 5),
(1, 4, 50),
(1, 5, 6);
SELECT u.* FROM user u
JOIN score s ON u.id = s.userid
JOIN team t ON s.teamid = t.id
WHERE t.teamName = 'ECNU' AND u.age <20;
SELECT SUM(s.score) FROM score s
JOIN team t on s.teamid = t.id
WHERE t.teamName = 'ECNU';
SELECT * FROM score;
DELETE FROM score WHERE userid = '4';

DELETE FROM user WHERE name = 'KEXUAN ZHOU';
SELECT * FROM user;