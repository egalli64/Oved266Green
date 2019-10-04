create table characters (
    character_id integer
        constraint character_pk primary key,
    first_name varchar2(20)
        constraint character_first_name_nn not null
        constraint character_first_name_uq unique,
    clan_name varchar2(20)
        constraint character_clan_name_nn not null
        constraint character_clan_name_uq unique,
    life_points integer
        constraint character_life_points_ck check ( life_points > 0)
        constraint character_life_points_nn not null,
    armor_class integer
        constraint character_armor_class_ck check ( armor_class > 0)
        constraint character_armor_class_nn not null,
    strength integer
        constraint character_strength_ck check ( strength > 0)
        constraint character_strength_nn not null,
    dexterity integer
        constraint character_dexterity_ck check ( dexterity > 0)
        constraint character_dexterity_nn not null,
    constitution integer
        constraint character_constitution_ck check ( constitution > 0)
        constraint character_constitution_nn not null,
    race_id integer
        constraint characters_race_id_fk references races(race_id) on delete cascade
        );
   
        
select *
from characters;

insert into characters values(10010, 'Bertrand', 'Russell',  52, 16, 18, 16, 20, 15001);
insert into characters values(10002, 'Srinivasa', 'Ramanujan', 67, 15, 14, 14, 22, 15004);
insert into characters values(10003, 'Igruk', 'Yok', 42, 17, 18, 14, 16, 15002);
insert into characters values(10004, 'Douzur', 'Glasukor', 69, 16, 14, 18, 20, 15002);
insert into characters values(10005, 'Feltix', 'Saner', 71, 17, 14, 18, 19, 15003);
insert into characters values(10006, 'Gorduin', 'Helecan', 52, 16, 16, 14, 18, 15004);

drop table characters;