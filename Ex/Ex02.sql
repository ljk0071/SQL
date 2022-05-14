--1
select count(manager_id) haveMngCnt
from employees;
--2
select MIN(min_salary) 최저임금
    ,MAX(max_salary) 최고임금
    ,MAX(max_salary) - MIN(min_salary) "최고임금 - 최저임금"
from employees e, jobs j
where e.job_id = j.job_id;

select to_char(Max(hire_date), 'yyyy-mm-dd')
from employees;
--3
select avg(salary)
    ,max(salary)
    ,min(salary)
    ,department_id
from employees
group by department_id
order by department_id desc;
--4
select e.job_id 업무
    ,round(avg(salary))
    ,max(salary)
    ,min(salary)
from employees e, jobs j
group by e.job_id
having e.job_id = j.job_id
order by round(avg(salary)), min(salary) desc;
--5
select e.job_id
    ,max(salary)
    ,round(avg(salary))
    ,min(salary)    
from employees e, jobs j
group by e.job_id
having e.job_id = j.job_id
order by min(salary) desc, round(avg(salary)) asc;
--6
select to_char(max(hire_date), 'yyyy-mm-dd day')
from employees;
--7
select department_id 부서
    ,avg(salary) 평균임금
    ,min(salary) 최저임금
    ,avg(salary)-min(salary) "평균임금 - 최저임금"
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;
--8
select job_id 업무
    ,max(salary)-min(salary)  "최고임금 - 최저임금"
from employees
group by job_id
order by max(salary)-min(salary) desc;
--9
select manager_id
    ,min_salary
    ,max_salary
    ,round((max_salary+min_salary)/2, 1)
from employees e, jobs j
where hire_date >= '05/01/01'
and e.job_id = j.job_id
and (max_salary+min_salary)/2 >= 5000
order by (max_salary+min_salary)/2 desc;
--10
select hire_date 
    ,case when hire_date < '02/12/31' then '창립멤버'
    when hire_date > '03/01/01' and hire_date < '04/01/01' then '03년입사'
    when hire_date > '04/01/01' and hire_date < '05/01/01' then '04년입사'
    when hire_date >= '05/01/01' then '상장이후입사'
    end "optDate"
from employees
order by hire_date;