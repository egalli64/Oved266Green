drop table potion_effect_history;
drop trigger potion_effect;

--creazione tabella per la storia delle battaglie
create table potion_effect_history (
    character_id integer
        references characters(character_id),
    old_strength integer,
    old_dexterity integer,
    old_constitution integer,
    new_strength integer,
    new_dexterity integer,
    new_constitution integer
    );
 
--definizione trigger battle   
create or replace trigger potion_effect
before update of strength, dexterity, constitution on characters
for each row
begin
    insert into potion_effect_history values(:new.character_id, :old.strength, :old.dexterity, :old.constitution, :new.strength, :new.dexterity, :new.constitution );
end potion_effect;
/


--esecuzione del trigger
update characters
set strength = strength + 2, dexterity = dexterity + 2, constitution = constitution - 2
where character_id = 1;

update characters
set strength = strength - 2, dexterity = dexterity - 2, constitution = constitution - 2
where character_id = 2;

select *
from potion_effect_history;

select *
from characters;

drop table potion_effect_history;