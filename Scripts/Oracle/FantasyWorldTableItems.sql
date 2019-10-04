create table items (
    item_id integer
        constraint item_pk primary key,
    item_name varchar(20)
        constraint item_name_nn not null
        constraint item_name_uq unique,
    bonus_strength integer
        constraint item_bonus_strength_ck check ( bonus_strength >= 0)
        constraint item_bonus_strength_nn not null,
    bonus_dexterity integer
        constraint item_dexterity_ck check ( bonus_dexterity >= 0)
        constraint item_dexterity_nn not null,
    bonus_constitution integer
        constraint item_constitution_ck check ( bonus_constitution >= 0)
        constraint item_constitution_nn not null,
    bonus_life_points integer
        constraint item_life_points_ck check ( bonus_life_points >= 0)
        constraint item_life_points_nn not null,
    item_kind varchar2(20)
        constraint item_kind_nn not null
        constraint item_kind_ck check ( item_kind in ( 'Weapon' , 'Armor' , 'Potion'))
        );

        
select *
from items;

drop table items;

/*insert into items values(10001, 'Spadone', 3, 0);
insert into items values(10002, 'Ascia', 2, 0);
insert into items values(10003, 'Armatura Imbottiba', 0, 2);
insert into items values(10004, 'Pozione Bomba', 3, 0);
insert into items values(10005, 'Armatura Completa', 0, 4);


--update items set bonus_attack = 0 where item_id = 10003;
--update items set bonus_armor_class = 2 where item_id = 10003;