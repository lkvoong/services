/*
-- used by voucher label report to use number of sheets to print multiple voucher labels
-- CRH 2/2/2013
-- CREATE TYPE voucherlabeltype before CREATE FUNCTION findvoucherlabels()
/*

CREATE TYPE voucherlabeltype AS (
  objectnumber varchar,
  determinationformatted varchar,
  family varchar,
  collectioninfo varchar,
  vouchernumber varchar,
  numbersheets integer,
  labelrequested varchar,
  gardeninfo varchar,
  vouchertype varchar,
  fieldcollectionnote varchar,
  annotation varchar,
  vouchercollectioninfo varchar
);
