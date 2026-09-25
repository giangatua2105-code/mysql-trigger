# mysql-trigger
# [Thực hành] Trigger trong MySQL

## Mô tả
Tạo Trigger tự động cập nhật cột `department` dựa trên mức lương `salary` khi INSERT vào bảng `employees`.

## Cấu trúc
- `trigger.sql` — Toàn bộ bài thực hành

## Nội dung thực hành

### 1. Tạo CSDL và bảng

```sql
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary     DECIMAL(10,2) NOT NULL
);
