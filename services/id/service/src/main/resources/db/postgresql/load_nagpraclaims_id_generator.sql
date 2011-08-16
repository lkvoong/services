/*	
 * This document is a part of the source code and related artifacts
 * for CollectionSpace, an open source collections management system
 * for museums and related institutions:
 *
 * http://www.collectionspace.org
 * http://wiki.collectionspace.org
 *
 * Copyright © 2009 Regents of the University of California
 *
 * Licensed under the Educational Community License (ECL), Version 2.0.
 * You may not use this file except in compliance with this License.
 *
 * You may obtain a copy of the ECL 2.0 License at
 * https://source.collectionspace.org/collection-space/LICENSE.txt
 */

/*
 * load_nagpraclaims_ id_generators_table.sql
 *
 * Loads a number pattern for NAGPRA Claims into the "id_generators" table,
 * used by the ID Service.
 *
 * $LastChangedRevision: $
 * $LastChangedDate: $
 */

/*
 * Note: in the priority column, values range from  '1' (highest)
 * to '9' (lowest).
 */

/*
 * NOTE: In the id_generator_state column, for numeric sequence parts
 * whose first generated value should start at the initial value
 * (such as '1'), enter '-1' for the <currentValue>
 *
 * Otherwise, the first generated value will be the next value
 * in the sequence after the initial value (e.g. '2', if the
 * initial value is '1').
 */

-- NAGPRA_CLAIM_NUMBER

INSERT INTO id_generators
    (csid, displayname, description, priority, last_generated_id, id_generator_state)
  VALUES 
    ('a253d167-4f1a-4be3-a477-a2bd8a30cd7f',
     'NAGPRA Claim Number',
     'Identifies a NAGPRA Claim.',
     '9',
     '',
'<org.collectionspace.services.id.SettableIDGenerator>
  <parts>
    <org.collectionspace.services.id.StringIDGeneratorPart>
      <initialValue>CL</initialValue>
      <currentValue>CL</currentValue>
    </org.collectionspace.services.id.StringIDGeneratorPart>
    <org.collectionspace.services.id.StringIDGeneratorPart>
      <!-- Space character -->
      <initialValue> </initialValue>
      <currentValue> </currentValue>
    </org.collectionspace.services.id.StringIDGeneratorPart>
    <org.collectionspace.services.id.YearIDGeneratorPart>
      <currentValue></currentValue>
    </org.collectionspace.services.id.YearIDGeneratorPart>
    <org.collectionspace.services.id.StringIDGeneratorPart>
      <initialValue>.</initialValue>
      <currentValue>.</currentValue>
    </org.collectionspace.services.id.StringIDGeneratorPart>
    <org.collectionspace.services.id.NumericIDGeneratorPart>
      <maxLength>6</maxLength>
      <initialValue>1</initialValue>
      <currentValue>-1</currentValue>
    </org.collectionspace.services.id.NumericIDGeneratorPart>
  </parts>
</org.collectionspace.services.id.SettableIDGenerator>');

