--before to start the user has to create the user green with the password green
--from the user sysdba
--create user green identified by green account unlock;
--grant connect, resource to green;
--alter user green quota unlimited on users;

--drop of the prevoius tabels with the same name
drop table created_characters;
drop table droppeditems;
drop table owneditems;
drop table characters;
drop table bosses;
drop table items;
drop table races;


--tables of the races
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
        

insert into races values(1, 'Human', 0, 4, 2);
insert into races values(2, 'Ogre', 4, 2, 1);
insert into races values(3, 'Gnome', 0, 4, 0);
insert into races values(4, 'Elf', 3, 3, 2);



--table of the characters
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
        constraint character_life_points_ck check ( life_points >= 0)
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
   

insert into characters values(1, 'Bertrand', 'Russell',  52, 16, 18, 16, 20, 1);
insert into characters values(2, 'Srinivasa', 'Ramanujan', 67, 15, 14, 14, 22, 4);
insert into characters values(3, 'Igruk', 'Yok', 42, 17, 18, 14, 16, 2);
insert into characters values(4, 'Douzur', 'Glasukor', 69, 16, 14, 18, 20, 2);
insert into characters values(5, 'Feltix', 'Saner', 71, 17, 14, 18, 19, 3);
insert into characters values(6, 'Gorduin', 'Helecan', 52, 16, 16, 14, 18, 4);



--table of bosses
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


insert into bosses values(1, 'Balor', 102, 21, 18, 17, 20);
insert into bosses values(2, 'Devils pit', 151, 19, 16, 18, 22);
insert into bosses values(3, 'Linnorg', 178, 17, 16, 22, 18);
insert into bosses values(4, 'Blob', 201, 19, 18, 16, 20);


--table of items
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

        

insert into items values(1, 'Spadone', 3, 0, 2, 10, 'Weapon');
insert into items values(2, 'Ascia', 2, 0, 0, 15, 'Weapon');
insert into items values(3, 'Armatura Imbottiba', 0, 2, 5, 5, 'Armor');
insert into items values(4, 'Pozione Bomba', 3, 0, 0, 0, 'Potion');
insert into items values(5, 'Armatura Completa', 0, 4, 0, 20, 'Armor');



--table of dropped items by bosses
create table droppeditems(
    boss_id integer
        constraint boss_id_fk references bosses(boss_id) on delete cascade,    
    item_id integer
        constraint item_boss_id_fk references items(item_id) on delete cascade
    );
    
insert into droppeditems values(1,2);
insert into droppeditems values(1,1);
insert into droppeditems values(2,3);
insert into droppeditems values(2,2);
    
    

--table of owned items by the characters
create table owneditems(
    character_id integer
        constraint character_id_fk references characters(character_id) on delete cascade,     
    item_id integer
        constraint item_id_fk references items(item_id) on delete cascade
    );
    
insert into owneditems values(1,2);
insert into owneditems values(4,2);
insert into owneditems values(4,3);
insert into owneditems values(2,4);



--table for the created characters
create table created_characters (
    character_id integer
        references characters(character_id),
    first_name varchar2(20),
    clan_name varchar2(20),    
    life_points integer,
    armor_class integer,
    strength integer,
    dexterity integer,
    constitution integer,
    race_id integer
    );
    
--trigger for the created characters
create or replace trigger created
after insert on characters
for each row
begin
    insert into created_characters values(
        :new.character_id, 
        :new.first_name, 
        :new.clan_name, 
        :new.life_points, 
        :new.armor_class, 
        :new.strength, 
        :new.dexterity, 
        :new.constitution , 
        :new.race_id
        );
end created;
/


insert into characters values(7, 'Boris', 'McKendrik', 102, 18, 18, 15, 16, 3);
insert into characters values(8, 'Abe', 'MMoonlight', 178, 14, 16, 20, 14, 1);

--table of characters history
create table characters_history(
    character_id integer
        references characters(character_id),
    old_first_name varchar2(20),
    new_first_name varchar2(20),
    old_clan_name varchar2(20),
    new_clan_name varchar2(20),
    old_life_points integer,
    new_life_points integer,
    old_armor_class integer,
    new_armor_class integer,
    old_strength integer,
    new_strength integer,
    old_dexterity integer,
    new_dexterity integer,
    old_constitution integer,
    new_constitution integer,
    old_race_id integer,
    new_race_id integer
    );


--trigger for the update of characters
create or replace trigger char_update
BEFORE update of character_id, first_name, clan_name, life_points, armor_class, strength, dexterity, constitution, race_id on characters
for each row
begin
    insert into characters_history values(
        :old.character_id,
        :old.first_name,:new.first_name,
        :old.clan_name,:new.clan_name,
        :old.life_points,:new.life_points,
        :old.armor_class,:new.armor_class,
        :old.strength,:new.strength,
        :old.dexterity,:new.dexterity,
        :old.constitution,:new.constitution,
        :old.race_id,:new.race_id
        );
end char_update;
/

update characters set life_points = life_points + 10 where character_id = 1;
update characters set armor_class = armor_class + 10 where character_id = 4;
update characters set armor_class = life_points + 10 where character_id = 7;
