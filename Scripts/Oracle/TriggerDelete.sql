drop trigger ereased;
drop table erased_characters;


create table erased_characters (
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




create or replace trigger ereased
before delete on characters
for each row
begin
    insert into erased_characters values(
        :old.character_id, 
        :old.first_name, 
        :old.clan_name, 
        :old.life_points, 
        :old.armor_class, 
        :old.strength, 
        :old.dexterity, 
        :old.constitution, 
        :old.race_id
        );
end ereased;
/

insert into characters values(9,'Gino','Pino',100,16,16,14,18,4);

delete from characters where character_id = 9;

select * from characters;
select * from erased_characters;