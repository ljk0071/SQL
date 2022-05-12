select first_name || ' ' || last_name as 이름
    ,salary 월급
    ,phone_number 전화번호
    ,hire_date 입사일
from employees
order by hire_date;

select job_title
    ,max_salary
from jobs, employees
order by salary desc;

select employee_id
    ,commission_pct
    ,salary
from employees
where salary >= 3000
and commission_pct is null;

select job_title
    ,max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;

select first_name
    ,salary
    ,NVL(commission_pct, 0)
from employees
where salary >= 10000
and salary < 14000
order by salary desc;

select first_name
    ,salary
    ,to_char(hire_date, 'YYYY-MM')
    ,department_id
from employees;

select first_name
    ,salary
from employees
where first_name like '%s%'
or first_name like '%s'
or first_name like 'S&'
or first_name like '%S%';

select department_id
from employees
order by LENGTH(department_id) desc;

select UPPER(country_name)
from countries
order by country_name asc;

select first_name
    ,salary
    ,phone_number
    ,replace(phone_number, '.', '-')
    ,hire_date
from employees
where hire_date <= '03/12/31';