create table dropitems(
    boss_id integer
        constraint boss_id_fk references bosses(boss_id) on delete cascade,
        
    item_id integer
        constraint item_id_fk references items(item_id) on delete cascade

);