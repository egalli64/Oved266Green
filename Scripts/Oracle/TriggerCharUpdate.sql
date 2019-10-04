drop table characters_history;
drop trigger char_update;

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

--test
select *
from characters_history;
select *
from characters;

update characters
set life_points = life_points + 100
where character_id = 1;

update characters set life_points = life_points + 10 where character_id = 1;
update characters set armor_class = armor_class + 10 where character_id = 4;
update characters set armor_class = life_points + 10 where character_id = 7;