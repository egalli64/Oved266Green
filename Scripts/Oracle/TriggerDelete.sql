drop trigger ereased;
drop table erased_characters;


create table erased_characters (
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




create or replace trigger ereased
before delete on characters
for each row
begin
    insert into erased_characters values(
        :new.character_id, 
        :new.first_name, 
        :new.clan_name, 
        :new.life_points, 
        :new.armor_class, 
        :new.strength, 
        :new.dexterity, 
        :new.constitution, 
        :new.race_id
        );
end ereased;
/

insert into characters values(9,'Gino','Pino',100,16,16,14,18,4);

delete from characters where character_id = 9;

select * from characters;

select * from erased_characters;