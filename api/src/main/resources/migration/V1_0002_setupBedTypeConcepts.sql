CREATE PROCEDURE setup_bed_type_concepts ()
BEGIN
  DECLARE v_bed_type_id INT;
  DECLARE bed_type_name VARCHAR(255);
  DECLARE disp_name VARCHAR(255);
  DECLARE bed_desc VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursors CURSOR FOR SELECT bed_type_id, name, display_name, description FROM bed_type;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cursors;
  	SET done = 0;
  	read_loop: LOOP
      FETCH cursors INTO v_bed_type_id, bed_type_name, disp_name, bed_desc;
      IF done THEN
      	LEAVE read_loop;
      END IF;
      call add_bed_type_concept(bed_type_name, bed_desc, disp_name);
  	END LOOP read_loop;
  	CLOSE cursors;
END;