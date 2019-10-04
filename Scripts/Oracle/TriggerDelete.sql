drop trigger erease;
drop table characters_history;


create table characters_history (
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




create or replace trigger erease
after delete on characters
for each row
begin
    insert into characters_history values(:old.character_id, :old.first_name, :old.clan_name, :old.life_points, :old.armor_class, :old.strength, :old.dexterity, :old.constitution , :old.race_id);
end erease;
/

insert into characters values(7,'Gino','Pino',100,16,16,14,18,4);

delete from characters
where
character_id = 7;

select * from characters;

select * from characters_history;