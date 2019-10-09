drop trigger created;
drop table created_characters;

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

select *
from created_characters;

select *
from characters;

insert into characters values(7, 'Boris', 'McKendrik', 102, 18, 18, 15, 16, 3);
insert into characters values(8, 'Abe', 'MMoonlight', 178, 14, 16, 20, 14, 1);