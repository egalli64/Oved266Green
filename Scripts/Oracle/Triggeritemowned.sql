drop table itemownedhystory;
drop trigger itemownedtrig;

create table itemownedhystory(
    character_id integer
        references characters(character_id),
    new_item_id integer
);

select *
from itemownedhystory;

create or replace trigger ITEMOWNEDTRIG
BEFORE insert on owneditems
for each row
begin
    insert into itemownedhystory values(
        :new.character_id,:new.item_id);
end ITEMOWNEDTRIG;
/

-- test --

select *
from owneditems;

insert into owneditems
values(1,2);

select *
from owneditems;

select *
from itemownedhystory;


