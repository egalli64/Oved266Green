create table items (
    item_id integer
        constraint item_pk primary key,
    item_name varchar(20)
        constraint item_name_nn not null
        constraint item_name_uq unique,
    bonus_attack integer
        constraint item_bonus_attack_ck check ( bonus_attack >= 0)
        constraint item_bonus_attack_nn not null,
    bonus_armor_class integer
        constraint item_bonus_armor_class_ck check ( bonus_armor_class >= 0)
        constraint item_bonus_armor_class_nn not null
        );
        
select *
from items;

drop table items;

insert into items values(10001, 'Spadone', 3, 0);
insert into items values(10002, 'Ascia', 2, 0);
insert into items values(10003, 'Armatura Imbottiba', 0, 2);
insert into items values(10004, 'Pozione Bomba', 3, 0);
insert into items values(10005, 'Armatura Completa', 0, 4);


update items set bonus_attack = 0 where item_id = 10003;
update items set bonus_armor_class = 2 where item_id = 10003;