show databases;

use company_constraints;

show tables;

use ecommerce;
show tables;

select * from employee;
select * from departament;

-- PARTE 1

-- Qual o departamento com maior número de pessoas?

SELECT d.dname, COUNT(e.ssn) AS total_funcionarios
FROM departament d
JOIN employee e ON d.dnumber = e.dno
GROUP BY d.dname
ORDER BY total_funcionarios DESC
LIMIT 1;

-- Quais são os departamentos por cidade?

SELECT d.dname, e.fname, e.lname
FROM departament d
JOIN employee e ON d.dnumber = e.dno
ORDER BY d.dname, e.lname;

-- Criar os índices
CREATE INDEX idx_employee_dno ON employee(dno);
CREATE INDEX idx_departament_dname ON departament(dname);
CREATE INDEX idx_dept_locations_dnumber ON dept_locations(dnumber);
CREATE INDEX idx_employee_lname ON employee(lname);


-- PARTE 2

DELIMITER $$

CREATE PROCEDURE sp_manipula_employee(
    IN opcao INT,
    IN p_ssn CHAR(9),
    IN p_fname VARCHAR(50),
    IN p_lname VARCHAR(50),
    IN p_dno INT
)
BEGIN
    CASE opcao
        WHEN 1 THEN
            INSERT INTO employee (ssn, fname, lname, dno)
            VALUES (p_ssn, p_fname, p_lname, p_dno);

        WHEN 2 THEN
            UPDATE employee
            SET fname = p_fname,
                lname = p_lname,
                dno = p_dno
            WHERE ssn = p_ssn;

        WHEN 3 THEN
            DELETE FROM employee WHERE ssn = p_ssn;

        ELSE
            SELECT 'Opção inválida' AS mensagem;
    END CASE;
END$$

DELIMITER ;

-- Testar Procedure

-- Inserir
CALL sp_manipula_employee(1, '111222333', 'Ana', 'Pereira', 2);

-- Atualizar
CALL sp_manipula_employee(2, '123456789', 'Maria', 'Silva', 3);

-- Remover
CALL sp_manipula_employee(3, '123456789', NULL, NULL, NULL);















