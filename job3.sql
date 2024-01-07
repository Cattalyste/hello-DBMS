SELECT * FROM students;
SELECT * FROM students WHERE age > 20;
select * from students order by
    case grade
        when 'A+' then 1
        when 'A'  then 2
        when 'A-' then 3
        when 'B+' then 4
        when 'B'  then 5
        when 'B-' then 6
        when 'C+' then 7
        when 'C'  then 8
        when 'C-' then 9
        else 99     
    end ASC;