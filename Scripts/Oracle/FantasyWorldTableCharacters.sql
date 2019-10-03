create table characters (
    character_id integer
        constraint character_pk primary key,
    first_name varchar2(20)
        constraint character_first_name_nn not null
        constraint character_first_name_uq unique,
    last_name varchar2(20)
        constraint character_last_name_nn not null
        constraint character_last_name_uq unique,
    life_points integer
        constraint character_life_points_ck check ( life_points > 0)
        constraint character_life_points_nn not null,
    armor_class integer
        constraint character_armor_class_ck check ( armor_class > 0)
        constraint character_armor_class_nn not null,
    race_id integer
        constraint characters_race_id_fk references races(race_id) on delete cascade
        );
   
        
select *
from characters;

insert into characters values(1001, 'Bertrand', 'Russell', 52, 16, 101);
insert into characters values(1002, 'Srinivasa', 'Ramanujan', 67, 15, 104);
insert into characters values(1003, 'Igruk', 'Yok', 42, 17, 102);
insert into characters values(1004, 'Douzur', 'Glasukor', 69, 16, 102);
insert into characters values(1005, 'Feltix', 'Saner', 71, 17, 103);
insert into characters values(1006, 'Gorduin', 'Helecan', 52, 16, 104);