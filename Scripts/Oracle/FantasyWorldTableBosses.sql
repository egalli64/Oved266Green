create table bosses (
    boss_id integer
        constraint boss_pk primary key,
    boss_name varchar2(20)
        constraint boss_first_name_nn not null
        constraint boss_first_name_uq unique,
    boss_life_points integer
        constraint boss_life_points_ck check ( boss_life_points > 0)
        constraint boss_life_points_nn not null,
    boss_armor_class integer
        constraint boss_armor_class_ck check ( boss_armor_class > 0)
        constraint boss_armor_class_nn not null,
    boss_strength integer
        constraint boss_strength_ck check ( boss_strength > 0)
        constraint boss_strength_nn not null,
    boss_dexterity integer
        constraint boss_dexterity_ck check ( boss_dexterity > 0)
        constraint boss_dexterity_ck_nn not null,
    boss_constitution integer
        constraint boss_constitution_ck check ( boss_constitution > 0)
        constraint boss_constitution_nn not null
        );

select *
from bosses;

insert into bosses values(30001, 'Balor', 102, 21, 18, 17, 20);
insert into bosses values(30002, 'Devils pit', 151, 19, 16, 18, 22);
insert into bosses values(30003, 'Linnorg', 178, 17, 16, 22, 18);
insert into bosses values(30004, 'Blob', 201, 19, 18, 16, 20);

drop table bosses;