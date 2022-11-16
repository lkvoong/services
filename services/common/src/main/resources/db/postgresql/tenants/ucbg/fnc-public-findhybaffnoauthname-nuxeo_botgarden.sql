-- function to get hybrid, affinity, or taxon name with no author; requires taxonomicidentgroup.id

-- DROP FUNCTION public.findhybaffnoauthname (tigid varchar);

CREATE OR REPLACE FUNCTION public.findhybaffnoauthname (tigid varchar)
  RETURNS varchar
  LANGUAGE PLPGSQL
  IMMUTABLE STRICT
AS $$

DECLARE
  taxon_name varchar(200);
  taxon_noauth varchar(200);
  is_hybrid boolean;
  has_afftaxon boolean;
  aff_taxon varchar(200);
  aff_noauth varchar(200);
  aff_genus varchar(100);
  fhp_name varchar(200);
  fhp_genus varchar(100);
  mhp_name varchar(200);
  mhp_genus varchar(100);
  mhp_rest varchar(200);
  return_name varchar(300);

BEGIN
  select into
    taxon_name,
    taxon_noauth,
    is_hybrid,
    has_afftaxon,
    aff_taxon,
    aff_noauth,
    aff_genus
      getdispl(tig.taxon),
      coalesce(findnoauthname(tig.taxon), getdispl(tig.taxon), ''),
      tig.hybridflag, 
      length(coalesce(trim(getdispl(tig.affinitytaxon)), '')) > 0,
      regexp_replace(getdispl(tig.affinitytaxon), '^([^ ]+)( ?[^ ]*)$', '\1 aff.\2'),
      regexp_replace(
        coalesce(findnoauthname(tig.affinitytaxon), getdispl(tig.affinitytaxon), ''),
        '^([^ ]+)( ?[^ ]*).*$', '\1 aff.\2'),
      regexp_replace(
        coalesce(findnoauthname(tig.affinitytaxon), getdispl(tig.affinitytaxon), ''),
        '^([^ ]+)( ?.*)$', '\1')
  from taxonomicidentgroup tig
  where tig.id = $1;

  if not found then
    return null;

  elseif is_hybrid is false and has_afftaxon is false then
    return taxon_noauth;

  elseif is_hybrid is false and has_afftaxon is true then
    return aff_noauth;

  elseif is_hybrid is true then
    select into fhp_name, fhp_genus
      coalesce(findnoauthname(fhp.taxonomicidenthybridparent), getdispl(fhp.taxonomicidenthybridparent), ''),
      regexp_replace(
        coalesce(findnoauthname(fhp.taxonomicidenthybridparent), getdispl(fhp.taxonomicidenthybridparent), ''),
        '^([^ ]+) ?.*$', '\1')
    from taxonomicidentgroup tig
    inner join hierarchy hfhp on (
      hfhp.parentid = tig.id and hfhp.name = 'taxonomicIdentHybridParentGroupList')
    inner join taxonomicidenthybridparentgroup fhp on (
      hfhp.id = fhp.id and fhp.taxonomicidenthybridparentqualifier = 'female')
    where tig.id = $1;

    select into mhp_name, mhp_genus, mhp_rest
      coalesce(findnoauthname(mhp.taxonomicidenthybridparent), getdispl(mhp.taxonomicidenthybridparent), ''),
      regexp_replace(
        coalesce(findnoauthname(mhp.taxonomicidenthybridparent), getdispl(mhp.taxonomicidenthybridparent), ''),
        '^([^ ]+) ?.*$', '\1'),
      regexp_replace(
        coalesce(findnoauthname(mhp.taxonomicidenthybridparent), getdispl(mhp.taxonomicidenthybridparent), ''),
        '^([^ ]+)( ?.*)$', '\2')
    from taxonomicidentgroup tig
    inner join hierarchy hmhp on (
      hmhp.parentid = tig.id and hmhp.name = 'taxonomicIdentHybridParentGroupList')
    inner join taxonomicidenthybridparentgroup mhp on (
      hmhp.id = mhp.id and mhp.taxonomicidenthybridparentqualifier = 'male')
    where tig.id = $1;

    if has_afftaxon is false then
      if fhp_genus = mhp_genus then
        return_name := trim(fhp_name || ' × ' || substr(mhp_genus, 1, 1) || '.' || mhp_rest);
      else
        return_name := trim(fhp_name || ' × ' || mhp_name);
      end if;
    else
      if aff_genus = mhp_genus then
        return_name := trim(aff_noauth || ' × ' || substr(mhp_genus, 1, 1) || '.' || mhp_rest);
      else
        return_name := trim(aff_noauth || ' × ' || mhp_name);
      end if;
    end if;

    if return_name = ' × ' then
      return taxon_noauth;
    else
      return return_name;
    end if;

  else 
    return null;

  end if;
END;
$$;
