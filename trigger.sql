-- =====================================================
-- [Thực hành] Trigger trong MySQL
-- CSDL: company
-- =====================================================

-- -----------------------------------------------------
-- BƯỚC 1: Tạo CSDL và bảng employees
-- -----------------------------------------------------
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary     DECIMAL(10,2) NOT NULL
);

-- -----------------------------------------------------
-- BƯỚC 2: Tạo Trigger update_department
-- Tự động gán department dựa vào salary khi INSERT
-- -----------------------------------------------------
DELIMITER //

CREATE TRIGGER update_department
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary >= 5000 THEN
        SET NEW.department = 'Management';
    ELSEIF NEW.salary >= 3000 THEN
        SET NEW.department = 'Sales';
    ELSE
        SET NEW.department = 'Support';
    END IF;
END //

DELIMITER ;

-- -----------------------------------------------------
-- BƯỚC 3: Demo sử dụng trigger
-- -----------------------------------------------------
INSERT INTO employees (name, department, salary)
VALUES
    ('John Doe',      'A', 3500),
    ('Jane Smith',    'A', 2000),
    ('David Johnson', 'A', 6000);

-- Kiểm tra kết quả: department đã được trigger tự cập nhật
SELECT * FROM employees;

-- -----------------------------------------------------
-- BƯỚC 4: Xem danh sách Trigger trong database
-- -----------------------------------------------------
SHOW TRIGGERS;

-- -----------------------------------------------------
-- BƯỚC 5: Xóa Trigger khi không cần nữa
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS update_department;
