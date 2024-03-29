create table races (
    race_id integer
        constraint race_pk primary key,
    race_name varchar2(20)
        constraint race_race_name_nn not null
        constraint race_race_name_uq unique,
    bonus_strength integer
        constraint race_bonus_strength_nn not null,
    bonus_dexterity integer
        constraint race_bonus_dexterity_nn not null,
    bonus_constitution integer
        constraint race_bonus_constitution_nn not null
        );
        
select *
from races;

insert into races values(1, 'Human', 0, 4, 2);
insert into races values(2, 'Ogre', 4, 2, 1);
insert into races values(3, 'Dwarf', 0, 4, 0);
insert into races values(4, 'Elf', 3, 3, 2);
insert into races values(5, 'Werewolf', 0, 4, 0);
insert into races values(6, 'Halfdragon', 3, 3, 2);

drop table races;