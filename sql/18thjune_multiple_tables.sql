WITH emp AS (
    SELECT 10000 as sal,100 as comm,'sachin' as ename,'Data Scientist' as job,10 as deptno  UNION ALL
    SELECT 20000,200,'tripathi','Data Engineer' ,20 UNION ALL
    SELECT 10000,20,'trip','Intern' ,20 UNION ALL
    SELECT 2000,NULL,'trips','college' ,20
  ),
  
dept AS(
      SELECT "star" as dname,10 as deptno,'INDIA' as loc  UNION ALL
      SELECT "regular",20,'CHINA' UNION ALL
      SELECT "normal",30 ,'USA'
)
 
-- 1- stacks 2 tables over each other with union all which checks for count of 
-- columns passed and dtypes of those

-- (select ename as ename_and_dname, deptno
-- from emp
-- where deptno = 10
-- union all
-- select dname, deptno
-- from dept)


-- 2-a union distinct will eliminate any rows which are duplicates from union all output

-- select deptno
--       from emp
--       union distinct
--     select deptno
-- from dept

-- 2-b equivalent to:

--  select distinct deptno
--  from
--  (select deptno
--       from emp
--       union all
--     select deptno
-- from dept)


-- (select e.ename ,d.loc
-- from emp as e,dept as d
-- where e.deptno = d.deptno)

