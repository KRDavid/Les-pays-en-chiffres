create or replace function countries(choix text)
returns table(country text, pop int, density int) 
language plpgsql 
as $$
begin
return query
select pays.country, pays.pop, pays.density from pays where pays.country = choix;
end;
$$;

create or replace procedure add_country(country_name text)
language plpgsql
as $$
begin
insert into pays(country, pop, density) values (country_name, 1000000 * random(), 1465 *random());
end;
$$;

create or replace function update_time()
returns trigger
language plpgsql 
as $$
begin
    NEW.date_insertion := current_timestamp;

return NEW;
end;
$$;

create trigger country_update
before insert or update
on data_pays
for each row
execute procedure update_time();
