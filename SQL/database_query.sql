use healthcheck;

-- simple
select room_id, exam_name
from room
where exam_name = 'Eyes';

-- aggregate
select Exam_name, avg(price) as avgPrice
from appointment
group by Exam_name
order by avgPrice;

-- join
'Retrieve pairs of doctor name and exam name that doctors hold exams which prices are higher than 50'
select distinct r.doctor_name, a.exam_name
from appointment a
         join room r
              on r.room_id = a.room_id
                  and r.exam_name = a.exam_name
where a.price > 50;

-- nested
'Retrieve the customer name and SSN who make appointments in Room R01'
select name, SSN
from customer
where name in
      (select name
       from appointment
       where room_id = 'R01');

-- correlated
'Retrieve the three exam names with the highest price'
select exam_name, price
from appointment a1
where 3 >
      (select count(*)
       from appointment a2
       where a1.Price < a2.price);

-- >= ALL
'Retrieve the room_ID, exam_name, Remin_nu which has the most remain number for each room'
SELECT R1.room_ID, R1.Exam_name, R1.Remain_nu
FROM room R1
WHERE R1.Remain_nu >= All
      (
          SELECT R2.Remain_nu
          FROM room R2
          WHERE R1.room_ID = R2.room_ID
      );


-- >Any
'Retrieve the customer name, account id who take the exam but do not charge the lowest price for  exam'
SELECT c.Name,c.Account_ID
FROM customer c
WHERE c.account_ID in
         (SELECT account_ID
         FROM appointment 
         WHERE appointment.Exam_name = 'Ears' AND
               Price > Any
                   (SELECT Price
                    FROM appointment
                    WHERE appointment.Exam_name = 'Ears'
                    )
        );

-- Exist
'Retrieve the customer name who take the 'Head' test'
SELECT c.Name, c.SSN
FROM customer c
WHERE EXISTS
  (
      SELECT *
      FROM result_table r
      WHERE c.account_ID = r.account_ID AND
            r.Exam_name = 'Head'
  );
  
-- NOT EXISTS
'Retrieve the customer name and SSN who does not take the head and eyes exam'
SELECT c.Name, c.SSN
FROM customer c
WHERE NOT EXISTS
     (
      SELECT *
      FROM appointment a
      WHERE a.Account_ID = c.Account_ID AND
            a.Exam_name in ('Head','Eyes')
        )
