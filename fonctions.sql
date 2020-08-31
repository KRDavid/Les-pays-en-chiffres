create or replace function countries(choix text)
returns table(country text, pop int, density int) 
language plpgsql 
as $$
begin
return query
select data_pays.country, data_pays.pop, data_pays.density from data_pays where data_pays.country = choix;
end;
$$;

create or replace procedure add_country(country_name text)
language plpgsql
as $$
begin
insert into data_pays(country, pop, density) values (country_name, 1000000 * random(), 1465 *random());
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

create or replace function class_countries()
returns table (country_name text, density int, class text)
language plpgsql
as $$
begin
return query
select data_pays.country, data_pays.density, CASE 
                                when data_pays.density < 600 then 'classe 4'
                                when data_pays.density < 900 then 'classe 3'
                                when data_pays.density < 1500 then 'classe 2'
                                else 'classe 1'
end as "class"
from data_pays;
end;
$$;


create or replace function class_country(choix text)
returns table (country_name text, density int, class text)
language plpgsql
as $$
begin
return query
select data_pays.country, data_pays.density, CASE 
                                when data_pays.density < 600 then 'classe 4'
                                when data_pays.density < 900 then 'classe 3'
                                when data_pays.density < 1500 then 'classe 2'
                                else 'classe 1'
end as "class"
from data_pays where data_pays.country = choix;
end;
$$;
