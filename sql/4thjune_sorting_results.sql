

WITH emp AS (
    SELECT 10000 as sal,100 as travel_comm,'sachin' as ename,'Data Scientist' as job,10 as deptno   UNION ALL
    SELECT 2000000,100000,'sacss','lead data science' ,10  UNION ALL
    SELECT 20000,200,'tripathi','Data Engineer' ,20 UNION ALL
    SELECT 2000,20,'trip','Intern' ,20 UNION ALL
    SELECT 2000,NULL,'trips','college' ,20 UNION ALL
    SELECT 20000000,10,'sac','Ceo' ,20 UNION ALL
    SELECT 2000000,100000,'sacss','manager' ,20
  )
 
--1 you can use any column in where and order by which isn't in select 
--   select ename,sal,job
--   from emp
--   where deptno=20
--   order by travel_comm desc

--2 you can use column no in order by to specify column if you are using the column specified in select query
--   select ename,sal,job
--   from emp
--   where deptno=20
--   order by 2 desc

--3 you can use multiple columns  in order by with their different asc,desc as it executes from left to right

-- select deptno,sal,ename,job
-- from emp
-- order by deptno desc,sal desc

--4 gives the substring 
-- select substr(job,length(job)-1)
-- from emp

--5 creates the substr and sorts the result by its aliases without inline view as ORDER BY executes after select 
-- (select ename,job,substr(job,length(job)-1) as sort_substr
--       from emp)
--       order by sort_substr

--6 creates auxillary column to sort the Nulls first while travel_comm in desc
-- select ename,sal,travel_comm
--   from (
--   select ename,sal,travel_comm,
--         case when travel_comm is null then 0 else 1 end as is_null
--  from emp
-- )x
--      order by is_null,travel_comm desc

--7 same as 6 here we don't need auxillary column
-- select ename,sal,travel_comm
--    from emp
--   order by travel_comm desc nulls first

--8 creates auxillary column to sort travel_comm for all the data people and salary for others

-- select ename,sal,job,travel_comm,
--             case when (job like '%data%' or job like 'Data%') then travel_comm else sal end as ordered
--       from emp
-- order by 5 desc

--9 without creating auxillary column , we can pass the same column to order by

-- select ename,sal,job,travel_comm
--      from emp
--  order by case when (job like '%data%' or job like 'Data%') then travel_comm  else sal end desc


-- Note in order by always think of creating an auxillary column and passing that col to 
-- order by if you have to do a conditional sorting on a columns value like when job = data and others similarly when 
-- a column is NULL and not NULL










