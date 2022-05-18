--pr05
--01
select first_name
    ,manager_id
    ,commission_pct
    ,salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;
--02
select employee_id
    ,first_name
    ,salary
    ,to_char(hire_date , 'yyyy-mm-dd')
    ,replace(phone_number , '.' , '-')
    ,department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                from employees
                                group by department_id);
                                
--03
select m.manager_id
    ,e.first_name
    ,m.avgsa
    ,m.misa
    ,m.masa
from employees e, (select manager_id
                        ,round(avg(salary), 1) avgsa
                        ,min(salary) misa
                        ,max(salary) masa
                    from employees
                    where manager_id is not null
                    and hire_date > '04/12/31'
                    group by manager_id
                    having round(avg(salary), 1) >= 5000
                    and min(salary) >= 5000
                    order by avgsa desc) m
where e.employee_id = m.manager_id;
--04
select e.employee_id
    ,e.first_name
    ,department_name
    ,m.first_name
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join employees m
on e.manager_id = m.employee_id;
--05
select *
from (select rownum rn
    ,employee_id
    ,first_name
    ,department_name
    ,salary
    ,hire_date
from (select employee_id
    ,first_name
    ,department_name
    ,salary
    ,hire_date
from employees e, departments d
where e.department_id = d.department_id
and hire_date > '04/12/31'
order by hire_date))
where rn between 11 and 20;
--06
select rn
    ,first_name || ' ' || last_name
    ,salary 연봉
    ,department_name 부서이름
    ,hire_date
from(select rownum rn
            ,first_name
            ,last_name
            ,salary
            ,department_name
            ,hire_date
        from (select first_name
            ,last_name
            ,salary
            ,department_name
            ,hire_date
        from employees e, departments d
        where e.department_id = d.department_id
        order by hire_date desc))
where rn = 1
or rn = 2;
--07
select employee_id
    ,first_name
    ,last_name
    ,salary
    ,avgsa
    ,job_title
from employees e, jobs j, (select rn
    ,department_id
    ,avgsa
from(select rownum rn
    ,department_id
    ,avgsa
from(select department_id
    ,avg(salary) avgsa
from employees
group by department_id
order by avg(salary) desc))
where rn = 1) d
where e.job_id = j.job_id
and e.department_id = d.department_id;
--08

select department_name
from departments d, (select rn
    ,department_id
    ,avgsa
from(select rownum rn
    ,department_id
    ,avgsa
from(select department_id
    ,avg(salary) avgsa
from employees
group by department_id
order by avg(salary) desc))
where rn = 1) avg
where d.department_id = avg.department_id;

--09
select region_name
from(select rownum rn
    ,region_name
from(select region_name
    ,avg(salary)
from employees e, departments d, locations l ,countries c, regions r
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
group by region_name))
where rn = 1;
--10
select job_title
from jobs j,(select rownum rn
                ,job_id
                ,avg
            from(select e.job_id
                ,avg(salary) avg
            from employees e, jobs j
            where e.job_id = j.job_id
            group by e.job_id
            order by avg(salary) desc)) avgj
where rn = 1
and j.job_id = avgj.job_id;