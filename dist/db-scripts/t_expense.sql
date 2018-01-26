DROP TABLE t_expense;
CREATE TABLE t_expense (id int NOT NULL AUTO_INCREMENT, amount int, etype varchar(50), description varchar(300), is_active tinyint(1), created_by varchar(100), created_on datetime, updated_by int, updated_on datetime, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO t_expense (id, amount, etype, description, is_active, created_by, created_on, updated_by, updated_on) VALUES (1, 32, 'Others', 'haqq mehr', true, 'Babu', '2018-01-25 17:15:50', null, null);
INSERT INTO t_expense (id, amount, etype, description, is_active, created_by, created_on, updated_by, updated_on) VALUES (2, 2700, 'Electricity', 'Electricity Bill for Month of June 2017', true, 'Naseer', '2018-01-25 17:22:18', 1, '2018-01-26 15:14:07');
INSERT INTO t_expense (id, amount, etype, description, is_active, created_by, created_on, updated_by, updated_on) VALUES (3, 5000, 'Others', 'Tax', true, 'Ramzan', '2018-01-25 17:24:30', 1, '2018-01-26 15:15:50');
