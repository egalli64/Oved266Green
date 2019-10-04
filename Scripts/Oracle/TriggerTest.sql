create table created_characters (
    character_id integer,
    first_name varchar2(20),
    clan_name varchar2(20),    
    life_points integer,
    armor_class integer,
    strength integer,
    dexterity integer,
    constitution integer,
    race_id integer
    );
    
create or replace trigger create_character
before update of life_points, armor_class on characters
for each row
begin
    insert into characters_history values(:new.character_id, :new.first_name, :new.clan_name, :new.life_points, :new.armor_class, :new.strength, :new.dexterity, :new.constitution, :new.race_id);
end battle;
/

insert into characters
set character_id = 7, first_name = 'Boris', clan_name = 'McKendrik', life_points = 102, armor_class = 17, strength = 18, dexterity = 17, constitution = 20, race_id = 1;

select *
from characters
where character_id = 1;

select *
from characters_history;


create table characters_history (
    character_id integer
        references characters(character_id),
    life_points integer,
    armor_class integer,
    new_armor_class integer,
    strength integer,
    dexterity integer,
    constitution integer,
    race_id integer
    );

create or replace trigger battle
before update of life_points, armor_class on characters
for each row
begin
    insert into characters_history values(1, :old.life_points, :new.life_points, :old.armor_class, :new.armor_class);
end battle;
/


drop table characters_history;
drop trigger battle;