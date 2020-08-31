create or replace function countries(choix text)
returns table(country text, pop int, med_age text) 
language plpgsql 
as $$
begin
return query
select pays.country, pays.pop, pays.med_age from pays where pays.country = choix;
end;
$$;

