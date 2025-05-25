USE nexabank_db;

-- Users table (for banking site)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00
);

-- Transactions table (logs deposits/transfers)
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_from VARCHAR(50) NOT NULL,
    user_to VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Student debts (hidden exploitative fees)
CREATE TABLE student_debts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    debt_amount DECIMAL(10,2) NOT NULL,
    hidden_fees DECIMAL(10,2) NOT NULL
);

-- Insert sample data
INSERT INTO users (username, password, balance) VALUES 
    ('admin', 'admin123', 10000.00),
    ('john', 'student123', 500.00);

INSERT INTO student_debts (student_name, debt_amount, hidden_fees) VALUES
    ('John Doe', 50000.00, 12000.00),
    ('Jane Smith', 75000.00, 18000.00);