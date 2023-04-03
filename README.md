# DataManagement_BookingSystem

This project is to simulate the booking system of a health check institution, create different modules, establish connections and let the system complete the relevant records for the consumer module, doctor module, and booking information module through interaction.

Conceptual Model：<br />
CUSTOMER (**Account_ID**, SSN, Name, Gender, Contact_info, *Staff_id*)<br />
*Staff_nu*: foreign-key refers to stuff_nu in STAFF, NULL value not allowed

APPOINTMENT (**Account_ID**, Name, Price, Dept_name, *Room_id, Exam_name*)<br />
Account_ID: foreign-key refers to Account_ID in CUSTOMER, NULL value not allowed<br />
*Room_nu*: foreign-key refers to Room_nu in ROOM, NULL value not allowed<br />
*Exam_name*: foreign-key refers to Exam_name in ROOM, NULL value not allowed<br />

ROOM (**Room_id, Exam_name**, Doctor_name, Remain_nu, Dept_name)
*Dept_name*: foreign-key refers to Dept_name in DEPARTMENT, NULL value not allowed<br />

STAFF (**Staff_id**, Name, Phone_nu)

CUSTOMER_ROOM (***Account_ID, Room_nu, Exam_name***)
*Account_ID*: foreign-key refers to Account_ID in CUSTOMER, NULL value not allowed<br />
*Room_nu*: foreign-key refers to Room_nu in ROOM, NULL value not allowed<br />
*Exam_name*: foreign-key refers to Exam_name in ROOM, NULL value not allowed<br />

SCHEDULE (***Staff_nu, Room_nu, Exam_name***)
*Staff_nu*: foreign-key refers to stuff_nu in STAFF, NULL value not allowed<br />
*Room_nu*: foreign-key refers to Room_nu in ROOM, NULL value not allowed<br />
*Exam_name*: foreign-key refers to Exam_name in ROOM, NULL value not allowed<br />

RESULT_TABLE (***Room_nu, Exam_name, Account_ID*** ,Result_info, Total price)
*Room_nu*: foreign-key refers to Room_nu in ROOM, NULL value not allowed<br />
*Exam_name*: foreign-key refers to Exam_name in ROOM, NULL value not allowed<br />
*Account_ID*: foreign-key refers to Account_ID in CUSTOMER, NULL value not allowed<br />
