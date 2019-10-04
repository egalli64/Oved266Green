drop table itemswitchhistory;
drop trigger itemswitchtrig;

create table itemswitchhistory(
    item_id integer
        references items(item_id),
    old_character_id integer,
    new_character_id integer


);

select *
from itemswitchhistory;

create or replace trigger itemswitchtrig
BEFORE update of character_id on owneditems
for each row
begin
    insert into itemswitchhistory values(
        :old.item_id,:old.character_id,:new.character_id);
end itemswitchtrig;
/

-- test --

select *
from owneditems;

update owneditems
set character_id=1
where character_id=2 and item_id=4;

select *
from owneditems;

select *
from itemswitchhistory;


