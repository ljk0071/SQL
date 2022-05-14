--------------practice03
--1
select employee_id
    ,first_name
    ,last_name
    ,department_name
from employees e, departments d
where e.department_id = d.department_id
order by department_name, employee_id desc;
--2
select employee_id
    ,first_name
    ,salary
    ,department_name
    ,j.job_title
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id
order by employee_id asc;
-- 2-1
select employee_id
    ,first_name
    ,salary
    ,department_name
    ,j.job_title
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join jobs j
on e.job_id = j.job_id
order by employee_id asc;
--3
select l.location_id
    ,city
    ,department_name
    ,department_id
from locations l, departments d
where l.location_id = d.location_id
order by location_id;
-- 3-1
select l.location_id
    ,city
    ,department_name
    ,department_id
from locations l left outer join departments d
on l.location_id = d.location_id
order by location_id;
--4
select region_name
    ,country_name
from countries c, regions r
where c.region_id = r.region_id
order by region_name, country_name desc;
--5
select emp.employee_id
    ,emp.first_name
    ,emp.hire_date
    ,man.first_name
    ,man.hire_date
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;
--6
select country_name
    ,l.country_id
    ,city
    ,d.location_id
    ,department_name
    ,department_id
from departments d, locations l, countries c
where d.location_id = l.location_id
and l.country_id = c.country_id
order by country_name;
--7
select e.employee_id
    ,first_name||' '||last_name
    ,job_id
    ,start_date
    ,end_date
from jobs j right outer join employees e
on j.job_id = e.job_id
right outer join job_history jh
on j.job_id = jh.job_id
where job_id = 'AC_ACCOUNT';
--8
select e.department_id
    ,department_name
    ,m.first_name
    ,city
    ,country_name
    ,region_name
from employees e, employees m, departments d, locations l, countries c, regions r
where e.manager_id = m.employee_id
and e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id;
--9
select e.employee_id 사원번호
    ,e.first_name 직원이름
    ,department_name 부서명
    ,m.first_name 매니저이름
from employees e left outer join employees m
on e.manager_id = m.employee_id
left outer join departments d
on e.department_id = d.department_id
where e.manager_id is not null;

--매니저가 없으면 출력 x
