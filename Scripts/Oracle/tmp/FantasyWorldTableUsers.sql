create table users (
    user_id integer
        constraint user_pk primary key,
    user_name varchar2(20)
        constraint user_user_name_nn not null
        constraint user_user_name_uq unique,
    password_user varchar2(20)
        constraint user_password_user_nn not null
        );
   
        
select *
from users;

insert into users values(1, 'pippo', 'pippo');
insert into users values(2, 'paperino', 'paperino');

drop table players;