create table droppeditems(
    boss_id integer
        constraint boss_id_fk references bosses(boss_id) on delete cascade,    
    item_id integer
        constraint item_boss_id_fk references items(item_id) on delete cascade
    );
    

insert into droppeditems values(1,2);
insert into droppeditems values(1,1);
insert into droppeditems values(2,3);
insert into droppeditems values(2,2);