
WITH emp AS (
    SELECT 10000 as sal,100 as comm,'sachin' as ename,'Data Scientist' as job,10 as deptno  UNION ALL
    SELECT 20000,200,'tripathi','Data Engineer' ,20 UNION ALL
    SELECT 2000,20,'trip','Intern' ,20 UNION ALL
    SELECT 2000,NULL,'trips','college' ,20
  )
  
-- 1- Inline view can be used for col aliases and windowing and others.Execution order(From before where before select )
-- (select * From (select sal as salary, comm as commission  from emp)x
-- where salary>10000)

-- 2- to concat results of many columns
--  (select concat(ename, ' WORKS AS A ',job) as msg
--  from emp
-- where deptno>10)


-- 3- if/else with result aliased(creating an aux col on condition)
-- The execution flow is similar to if..if (when..when) the difference is it takes a row 
-- applies when ...when's first condition and stops when any satisfies,while if..if still
-- keep applying even if any satisfies
--  and if..else (when..else)
-- Go through this once daily (https://www.codecademy.com/forum_questions/51684a3d4ce76309b4001b9c) to keep in mind if..elif..else
-- when dealing with multiple cols in when clause be extra cautious as more than one condition can satisfy then at that time first matching condition will be 
-- considered

--  (select ename,sal,
-- CASE when sal=10000 then 'UNDERPAID'
--      when sal>=20000 then 'ok'
--      else 'why are you working'
--      end as status
--   from emp)


-- 4- limiting the number of results(remember the special case of oracle ROWNUM)
--  (select *
--  from emp limit 5)
-- This is equivalent to (in Oracle) :
--  (select *
--  from emp 
-- where rownum <= 5)
-- As we can't pass rownum =5 as oracle will check whether returned query row is rownum = 5 which won't be true hence row discarded


--5-  Random results : (if more than 2)limiting the number of results and also randomizing the result. Execution order(order by before limit)
-- select ename,job
--  from emp
--  order by rand() limit 2

--6- Finding Nulls (as Nulls can't be compared with Nulls)
-- (select *
--  from emp
--   where comm is null)

--7- replacing Nulls
--a- creating an aux column via when then (for full table)
-- (select *,
-- CASE
-- when comm is null then 0
-- else comm
-- end as comms
--  from emp)

--b- creating an aux column using coalesce (for full table)
-- (select  *,coalesce(comm,0) as comms
--    from emp)

--c- one more alternative (for null row)
-- (select *,0 as comms  from emp 
-- where comm is NULL)

--d- for multiple cols
-- (select  *,coalesce(comm,0) as comms,
-- coalesce(sal,0) as sals
--    from emp)

-- coalesce is syntactic shortcut for the CASE expression(https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql?view=sql-server-ver15)


--8- pattern matching
--  (select ename, job
--   from emp
--  where deptno in (10,20)
--    and (ename like 's%' or job like '%er'))
