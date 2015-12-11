package org.collectionspace.services.structureddate;

public enum Certainty {
	AFTER         ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(after)'After'"),
	APPROXIMATELY ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(approximate)'Approximate'"),
	BEFORE        ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(before)'Before'"),
	CIRCA         ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(circa)'Circa'"),
	POSSIBLY      ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(possibly)'Possibly'"),
	PROBABLY      ("urn:cspace:ucjeps.cspace.berkeley.edu:vocabularies:name(datecertainty):item:name(probably)'Probably'");
	
	private final String value;
	
	private Certainty(String value) {
		this.value = value;
	}
	
	public String toString() {
		return value;
	}
}
