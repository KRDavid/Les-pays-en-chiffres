CREATE OR REPLACE FUNCTION countries(choix TEXT)
RETURNS TABLE(country TEXT, pop INT, density INT) 
LANGUAGE plpgsql 
AS $$
BEGIN
RETURN query
SELECT data_pays.country, data_pays.pop, data_pays.density FROM data_pays WHERE data_pays.country = choix;
END;
$$;

CREATE OR REPLACE PROCEDURE add_country(country_name TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO data_pays(country, pop, density) VALUES (country_name, 1000000 * random(), 1465 *random());
END;
$$;

CREATE OR REPLACE FUNCTION update_time()
RETURNS trigger
LANGUAGE plpgsql 
AS $$
BEGIN
    NEW.date_insertion := current_timestamp;

RETURN NEW;
END;
$$;

CREATE trigger country_update
BEFORE INSERT OR UPDATE
ON data_pays
FOR EACH ROW
execute PROCEDURE update_time();

CREATE OR REPLACE FUNCTION class_countries()
RETURNS TABLE (country_name TEXT, density INT, class TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query
SELECT data_pays.country, data_pays.density, CASE 
                                WHEN data_pays.density < 600 THEN 'classe 4'
                                WHEN data_pays.density < 900 THEN 'classe 3'
                                WHEN data_pays.density < 1500 THEN 'classe 2'
                                ELSE 'classe 1'
END AS "class"
FROM data_pays;
END;
$$;


CREATE OR REPLACE FUNCTION class_country(choix TEXT)
RETURNS TABLE (country_name TEXT, density INT, class TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
RETURN query
SELECT data_pays.country, data_pays.density, CASE 
                                WHEN data_pays.density < 600 THEN 'classe 4'
                                WHEN data_pays.density < 900 THEN 'classe 3'
                                WHEN data_pays.density < 1500 THEN 'classe 2'
                                ELSE 'classe 1'
END AS "class"
FROM data_pays WHERE data_pays.country = choix;
END;
$$;
