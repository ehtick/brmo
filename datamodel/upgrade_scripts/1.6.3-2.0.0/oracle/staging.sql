-- 
-- upgrade Oracle STAGING datamodel van 1.6.3 naar 2.0.0
--

-- PR#568 upgrade GDS2 module
ALTER TABLE laadproces ADD(afgifteid varchar2(255 char));
ALTER TABLE laadproces ADD(afgiftereferentie varchar2(255 char));
ALTER TABLE laadproces ADD(artikelnummer varchar2(255 char));
ALTER TABLE laadproces ADD(beschikbaar_tot timestamp);
ALTER TABLE laadproces ADD(bestandsreferentie varchar2(255 char));
ALTER TABLE laadproces ADD(contractafgiftenummer number(19,0));
ALTER TABLE laadproces ADD(contractnummer varchar2(255 char));
ALTER TABLE laadproces ADD(klantafgiftenummer number(19,0));

-- PR#688 controle module
alter table laadproces add  bestand_naam_hersteld varchar2(255 char);

-- onderstaande dienen als laatste stappen van een upgrade uitgevoerd
INSERT INTO brmo_metadata (naam,waarde) SELECT 'upgrade_1.6.3_naar_2.0.0','vorige versie was ' || waarde FROM brmo_metadata WHERE naam='brmoversie';
-- versienummer update
UPDATE brmo_metadata SET waarde='2.0.0' WHERE naam='brmoversie';
