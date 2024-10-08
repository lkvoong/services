CREATE OR REPLACE FUNCTION cinefiles_denorm.film_detail_summary(text, titlerc refcursor, directorrc refcursor, countryrc refcursor, filmyearrc refcursor, langrc refcursor, prodcorc refcursor, genrerc refcursor, subjectrc refcursor, reldocsrc refcursor)
 RETURNS SETOF refcursor
 LANGUAGE plpgsql
 STABLE STRICT
AS $function$
DECLARE
-- titleRC refcursor;
-- countryRC refcursor;

BEGIN
open titleRC FOR
select 'Title' as Content, film_id filmid, filmtitle as title
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT titleRC;

open directorRC FOR
select 'Directors' as Content, 2 as id, regexp_split_to_table(director, '[\|]+') as director
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT directorRC;

open countryRC FOR
select 'Countries' as Content, regexp_split_to_table(country, '[\|]+') as country
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT countryRC;

open filmyearRC FOR
select 'Years' as Content, regexp_split_to_table(filmyear, '[\|]+') as year
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT filmyearRC;

open langRC FOR
select 'Languages' as Content, regexp_split_to_table(filmlanguage, '[\|]+') as lang
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT langRC;

open prodcoRC FOR
select 'Production Co' as Content, 2 as id, regexp_split_to_table(prodco, '[\|]+') as prodco
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT prodcoRC;

open genreRC FOR
select 'Genres' as Content, regexp_split_to_table(genre, '[\|]+') as genre
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT genreRC;

open subjectRC FOR
select 'Subjects' as Content, 2 as id, regexp_split_to_table(subject, '[\|]+') as subject
from cinefiles_denorm.filmlist_view
where film_id = $1;
RETURN NEXT subjectRC;

open reldocsRC FOR
select 'Related Docs' as Content, dv.doc_id as id, dv.doctitle as title, dv.doctype as type, 
    dv.pages as pages, dv.pg_info as pg_info, dv.source as source, 2 as name_id, dv.author as author,
    dv.pubdate as pubdate, null as juliandate, dv.code as code, dv.docurl as docurl
from cinefiles_denorm.filmlist_view fv
inner join cinefiles_denorm.filmdocs fd on (fd.film_id=fv.film_id)
inner join cinefiles_denorm.doclist_view dv on (fd.doc_id=dv.doc_id)
where fv.film_id = $1
order by juliandate desc, dv.doc_id;
RETURN NEXT reldocsRC;

RETURN;
END;
$function$
