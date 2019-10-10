create table dropped_items(
    boss_id integer
        constraint boss_id_fk references bosses(boss_id) on delete cascade,    
    item_id integer
        constraint item_boss_id_fk references items(item_id) on delete cascade
    );
    

insert into dropped_items values(1,2);
insert into dropped_items values(1,1);
insert into dropped_items values(2,3);
insert into dropped_items values(2,2);