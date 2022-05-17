--pr04

--1
select count(salary)
from employees
where salary < (select avg(salary)
                        from employees);
                        
--2
select e.employee_id
    ,e.first_name
    ,e.salary
    ,avgmax.avgsalary
    ,avgmax.maxsalary
from employees e, (select round(avg(salary)) avgsalary
                        ,max(salary) maxsalary
                    from employees
                    where salary >= (select round(avg(salary))
                    from employees)
                    and salary <= (select max(salary)
                    from employees)) avgmax
where salary >= (select round(avg(salary))
                from employees)
and salary <= (select max(salary)
                from employees)
order by salary;

--3
select l.location_id
    ,street_address
    ,postal_code
    ,city
    ,l.state_province
    ,country_id
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.first_name = 'Steven'
and e.last_name = 'King';
--4
select employee_id
    ,first_name
    ,salary
from employees
where salary <any (select salary
                from employees
                where job_id = 'ST_MAN')
order by salary desc;
--5
--조건절
select employee_id
    ,first_name
    ,salary
    ,department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                from employees
                                group by department_id)
order by salary desc;
--테이블조인
select employee_id
    ,first_name
    ,e.salary
    ,e.department_id
from employees e, (select department_id, max(salary) salary
                                from employees
                                group by department_id) maxsalary
where e.department_id = maxsalary.department_id
and e.salary = maxsalary.salary
order by salary desc;

--6
select job_title
    ,sum(salary)
from employees e, jobs j
where e.job_id = j.job_id
group by job_title
order by sum(salary) desc;
--7
select e.employee_id
    ,e.first_name
    ,e.salary
from employees e, (select department_id 
                        ,round(avg(salary)) salary
                    from employees
                    group by department_id) avg                   
where e.department_id = avg.department_id
and e.salary > avg.salary;
--8
select rn
    ,employee_id
    ,first_name
    ,salary
    ,hire_date
from (select rownum rn
            ,employee_id
            ,first_name
            ,salary
            ,hire_date
    from (select employee_id
                ,first_name
                ,salary
                ,hire_date
            from employees
            order by hire_date)
    )
where rn between 11 and 15;