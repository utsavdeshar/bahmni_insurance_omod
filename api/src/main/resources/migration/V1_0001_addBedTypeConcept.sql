CREATE PROCEDURE add_bed_type_concept (bed_type VARCHAR(255), short_name VARCHAR(255), concept_description VARCHAR(255))

BEGIN
	DECLARE concept_id INT;
	DECLARE concept_name_short_id INT;
	DECLARE concept_name_full_id INT;
	
	set @concept_id = 0;
    set @answer_concept_id = 0;
    set @concept_name_short_id = 0;
    set @concept_name_full_id = 0;
	
	SELECT concept_attribute_type_id FROM concept_attribute_type WHERE name = 'saleable' INTO @concept_attribute_type_id;
	
    call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, bed_type, short_name, 'N/A', 'Misc', true);
	call add_concept_description(@concept_id, concept_description);
    INSERT INTO concept_attribute (concept_id, attribute_type_id, value_reference, uuid, creator, date_created, changed_by, date_changed) VALUES (concept_id, @concept_attribute_type_id, true, uuid(), 1, now(), 1, now());
  	
    select c.uuid from concept_name cn inner join concept c on cn.concept_id = c.concept_id where cn.name = bed_type and cn.concept_name_type = 'FULLY_SPECIFIED' into @concept_uuid;
    
    INSERT INTO event_records (uuid, title, uri, object,category, date_created, tags) VALUES
  			(uuid(), 'reference data', concat('/openmrs/ws/rest/v1/reference-data/resources/', @concept_uuid), concat('/openmrs/ws/rest/v1/reference-data/resources/', @concept_uuid), 'saleable', now(), 'saleable');
    
END;