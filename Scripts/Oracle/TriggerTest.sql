create table characters_history (
    character_id integer
        references characters(character_id),
    old_life_points integer,
    new_life_points integer,
    old_armor_class integer,
    new_armor_class integer
    );
    
create or replace trigger battle
before update of life_points, armor_class on characters
for each row
begin
    insert into characters_history values(1, :old.life_points, :new.life_points, :old.armor_class, :new.armor_class);
end battle;
/

update characters
set life_points = life_points + 100, armor_class = armor_class +100
where character_id = 1;

select *
from characters
where character_id = 1;

select *
from characters_history;

create or replace trigger battle
before update of life_points, armor_class on characters
for each row
begin
    insert into characters_history values(1, :old.life_points, :new.life_points, :old.armor_class, :new.armor_class);
end battle;
/


drop table characters_history;
drop trigger battle;