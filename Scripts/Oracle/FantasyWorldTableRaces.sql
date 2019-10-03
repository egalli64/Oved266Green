create table races (
    race_id integer
        constraint race_pk primary key,
    race_name varchar2(20)
        constraint race_race_name_nn not null
        constraint race_race_name_uq unique,
    bonus_attack integer
        constraint race_race_bonus_attack_nn not null,
    bonus_defence integer
        constraint race_race_bonus_defence_nn not null
        );
        
select *
from races;

insert into races values(101, 'Human', 0, 4);
insert into races values(102, 'Ogre', 4, 2);
insert into races values(103, 'Gnome', 0, 4);
insert into races values(104, 'Elf', 3, 3);