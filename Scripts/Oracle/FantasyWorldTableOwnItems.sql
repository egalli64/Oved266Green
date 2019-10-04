create table owneditems(
    character_id integer
        constraint character_id_fk references characters(character_id) on delete cascade,
        
    item_id integer
        constraint item_id_fk references items(item_id) on delete cascade



);