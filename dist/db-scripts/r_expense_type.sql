CREATE TABLE
    r_expense_type
    (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(50),
        link_url VARCHAR(200),
        display_order INT,
        is_active TINYINT(1),
        PRIMARY KEY (id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO r_expense_type (id, name, link_url, display_order, is_active) VALUES (1, 'Electricity', '/electricity', 2, true);
INSERT INTO r_expense_type (id, name, link_url, display_order, is_active) VALUES (2, 'Others', '/others', 1, true);
INSERT INTO r_expense_type (id, name, link_url, display_order, is_active) VALUES (3, 'Montly Rent', '/monthlyrent', 3, true);
