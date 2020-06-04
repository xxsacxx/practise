
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


-- 3- if/else with result aliased
--  (select ename,sal,
-- CASE when sal=10000 then 'UNDERPAID'
--      when sal>=20000 then 'ok'
--      else 'why are you working'
--      end as status
--   from emp)


-- 4- limiting the number of results(remember the special case of oracle ROWNUM)
--  (select *
--  from emp limit 1)


--5- limiting the number of results and also randomizing the result. Execution order(order by before limit)
-- select ename,job
--  from emp
--  order by rand() limit 2

--6- Finding Nulls (as Nulls can't be compared with Nulls)
-- (select *
--  from emp
--   where comm is null)

--7- replacing Nulls
-- (select coalesce(comm,0) as comm
--    from emp)


--8- pattern matching
--  (select ename, job
--   from emp
--  where deptno in (10,20)
--    and (ename like 's%' or job like '%er'))
