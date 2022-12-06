-- function to get taxon name with no author; requires taxon name as refname, taxon_common.id or taxon displayname

-- DROP FUNCTION public.findnoauthname(taxonname varchar);

CREATE OR REPLACE FUNCTION public.findnoauthname(taxonname varchar)
 RETURNS varchar
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $$

DECLARE noauthname varchar(300);

BEGIN
  if ($1 = '') then
    return null;

  elsif ($1 ~ '^urn:') then
    select ttg.termdisplayname into noauthname
    from taxon_common tc
    join hierarchy httg on (
      tc.id = httg.parentid
      and httg.primarytype = 'taxonTermGroup')
    join taxontermgroup ttg on (
      httg.id = ttg.id
      and ttg.termtype = 'Taxon No Author Name')
    where tc.refname = $1;

  elsif ($1 ~ '^[a-z0-9-]+[0-9]') then
    select ttg.termdisplayname into noauthname
    from taxon_common tc
    join hierarchy httg on (
      tc.id = httg.parentid
      and httg.primarytype = 'taxonTermGroup')
    join taxontermgroup ttg on (
      httg.id = ttg.id
      and ttg.termtype = 'Taxon No Author Name')
    where tc.id = $1;

  else
    select ttg.termdisplayname into noauthname
    from taxon_common tc
    join hierarchy httg on (
      tc.id = httg.parentid
      and httg.primarytype = 'taxonTermGroup')
    join taxontermgroup ttg on (
      httg.id = ttg.id
      and ttg.termtype = 'Taxon No Author Name')
    where getdispl(tc.refname) = $1;
  end if;

  return noauthname;
END;
$$;

