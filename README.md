# Projeto SQL – Índices e Procedures

## 📌 Descrição
Este projeto foi desenvolvido como parte de um desafio de Banco de Dados.  
O objetivo é criar consultas SQL otimizadas com índices e procedures para manipulação de dados, aplicados ao banco `company_constraints`.

---

## 🚀 Parte 1 – Consultas e Índices

### Consultas criadas
- **Departamento com maior número de pessoas**: retorna o nome do departamento e a quantidade de funcionários, ordenando do maior para o menor.  
- **Departamentos por cidade**: lista os departamentos e suas respectivas localizações.  
- **Relação de empregados por departamento**: mostra os nomes dos empregados junto ao departamento em que trabalham.  

### Índices criados
- **idx_employee_dno** → acelera junções entre empregados e departamentos.  
- **idx_departament_dname** → melhora agrupamentos e ordenações por nome de departamento.  
- **idx_dept_locations_dnumber** → otimiza consultas que relacionam departamentos às cidades.  
- **idx_employee_lname** → facilita ordenações por sobrenome de empregado.  

Esses índices foram escolhidos com base nas consultas mais frequentes e relevantes, garantindo melhor performance sem sobrecarregar o banco.

---

## ⚙️ Parte 2 – Procedures

### Procedure criada
Foi desenvolvida uma procedure chamada `sp_manipula_employee` que permite realizar três operações diferentes de acordo com a opção passada como parâmetro:
- **1** → Inserção de um novo funcionário.  
- **2** → Atualização de dados de um funcionário existente.  
- **3** → Remoção de um funcionário.  

### Exemplos de uso
- Inserir funcionário: `CALL sp_manipula_employee(1, '111222333', 'Ana', 'Pereira', 2);`  
- Atualizar funcionário: `CALL sp_manipula_employee(2, '123456789', 'Maria', 'Silva', 3);`  
- Remover funcionário: `CALL sp_manipula_employee(3, '123456789', NULL, NULL, NULL);`  

⚠️ Observação: para remover um funcionário, é necessário excluir primeiro os registros relacionados em `dependent` e `works_on` devido às foreign keys.

---

## 📂 Estrutura do repositório
┣ 📜 indices_company.sql
┣ 📜 procedures.sql
┣ 📜 README.md


---

## ✅ Conclusão
Este projeto demonstra como:
- Criar consultas SQL otimizadas.  
- Definir índices relevantes para melhorar performance.  
- Utilizar procedures para manipulação de dados com controle de operações.  

---


