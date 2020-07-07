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
),

V as(
select ename,job,sal,deptno
  from emp
 where job = 'Data Scientist'
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

-- (select deptno
--       from emp
--       union distinct
--     select deptno
-- from dept)

-- 2-b equivalent to 2-a:

--  select distinct deptno
--  from
--  (select deptno
--       from emp
--       union all
--     select deptno
-- from dept)

-- 3-a Joins is combining rows from multiple tables over common columns 
-- (select e.ename ,d.loc
-- from emp as e,dept as d
-- where e.deptno = d.deptno)

-- 3-b equivalent to 3-a using inner join and on in the from clause rather than in where clause:
-- (select e.ename, d.loc
-- from emp e inner join dept d
-- on (e.deptno = d.deptno) )



-- For INNER JOIN, WHERE predicates and ON predicates have the same effect.

-- For OUTER JOIN, WHERE predicates and ON predicates have a different effect.

-- In general, it is always best to put a predicate where it belongs, logically. 
-- If the predicate is related to a JOIN operation, it belongs in the ON clause. 
-- If a predicate is related to a filter applied to the entire FROM clause, it belongs in the WHERE clause.


-- 4 Joins such that you want to display columns of only one table but only for  common values of common columns between two tables:
-- To get the common values of common columns between two tables using Intersect :
 	--   (select deptno from emp
 	-- intersect DISTINCT
 	--   select deptno from dept)

-- This gives the common values of dept no 

-- Now using IN we can get the values of other column for these rows from any table like:

-- (select ename,job,sal
--    from emp
--   where (deptno) in (
--    select deptno from emp
--  intersect DISTINCT
--    select deptno from dept
-- )
-- )

-- 5-a Join on multiple columns from clause (but taking values of columns from only one table):

-- (select e.empno,e.ename,e.job,e.sal,e.deptno from emp e join V
-- on ( e.ename = v.ename and e.job = v.job and e.sal = v.sal )
-- )

-- 5-b equivalent to 5-a where clause:

-- (select e.empno,e.ename,e.job,e.sal,e.deptno from emp e, V
-- where e.ename = v.ename and e.job = v.job and e.sal = v.sal
-- )











