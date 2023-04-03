use Healthcheck;

create table CUSTOMER(
    Account_ID varchar(10) not null unique primary key,
    SSN int not null unique,
    Name varchar(20) not null unique,
    Gender varchar(10),
    Contact_info varchar(100),
    Staff_ID varchar(10)
);
select * from CUSTOMER;

create table APPOINTMENT(
	Account_ID varchar(10) not null,
    Room_ID varchar(10) not null,
    Exam_name varchar(100) not null,
    Name varchar(20) not null,
    Price int,
    primary key(Account_ID,Room_ID,Exam_name)
);
select * from APPOINTMENT;

create table ROOM(
    Room_ID varchar(10) not null,
    Exam_name varchar(100) not null,
    Doctor_name varchar(20),
    Remain_nu int,
    primary key(Room_ID,Exam_name)
);
select * from ROOM;

create table STAFF(
    Staff_ID varchar(10) not null unique primary key,
    Name varchar(20) not null,
    Phone_nu varchar(20)
);
select * from STAFF;

create table CUSTOMER_ROOM(
	Account_ID varchar(10) not null,
    Room_ID varchar(10) not null,
    Exam_name varchar(100) not null,
    Date varchar(100),
    Time varchar(100),
	primary key(Account_ID,Room_ID,Exam_name)
);
select * from CUSTOMER_ROOM;

create table SCHEDULE(
      Staff_ID varchar(10) not null,
      Room_ID varchar(10) not null,
      Exam_name varchar(100),
      primary key(Staff_ID,Room_ID,Exam_name)
);
select * from SCHEDULE;

create table RESULT_TABLE(
      Account_ID varchar(10) not null,
	  Room_ID varchar(10) not null,
      Exam_name varchar(100) not null,
      Result_INFO varchar(100),
      primary key(Account_ID,Room_ID,Exam_name)
);

alter table CUSTOMER add constraint fk_cus_staff foreign key (Staff_ID) references STAFF(Staff_ID);
alter table APPOINTMENT add constraint fk_app_cus foreign key (Account_ID) references CUSTOMER(Account_ID);
alter table APPOINTMENT add constraint fk_app_room foreign key (Room_ID,Exam_name) references ROOM(Room_ID,Exam_name);
alter table CUSTOMER_ROOM add constraint fk_cusroom_cus foreign key (Account_ID) references CUSTOMER(Account_ID);
alter table CUSTOMER_ROOM add constraint fk_cusroom_room foreign key (Room_ID,Exam_name) references ROOM(Room_ID,Exam_name);
alter table SCHEDULE add constraint fk_sche_staff foreign key (Staff_ID) references STAFF(Staff_ID);
alter table SCHEDULE add constraint fk_sche_room foreign key (Room_ID,Exam_name) references ROOM(Room_ID,Exam_name);
alter table RESULT_TABLE add constraint fk_res_cus foreign key (Account_ID) references CUSTOMER(Account_ID);
alter table RESULT_TABLE add constraint fk_res_room foreign key (Room_ID,Exam_name) references ROOM(Room_ID,Exam_name);
