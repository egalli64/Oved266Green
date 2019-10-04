create table owned_items(
    character_id integer
        constraint character_id_fk references characters(character_id) on delete cascade,     
    item_id integer
        constraint item_id_fk references items(item_id) on delete cascade
    );
    
insert into owned_items values(1,2);
insert into owned_items values(4,2);
insert into owned_items values(4,3);
insert into owned_items values(2,4);