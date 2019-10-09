drop table characters_battle;
drop trigger battle;

--creazione tabella per la storia delle battaglie
create table characters_battle (
    character_id integer
        references characters(character_id),
    old_life_points integer,
    new_life_points integer
    );
 
--definizione trigger battle   
create or replace trigger battle
before update of life_points on characters
for each row
begin
    insert into characters_battle values(:new.character_id, :old.life_points, :new.life_points);
end battle;
/


--esecuzione del trigger
update characters
set life_points = life_points + 5
where character_id = 3;

update characters
set life_points = life_points + 10
where character_id = 4;

select *
from characters_battle;

select *
from characters;

drop table characters_battle;
    