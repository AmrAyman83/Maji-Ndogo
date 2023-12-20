In second part of Query we used this to correcting pollution data with LIKE and String operations :
CREATE TABLE
md_water_services.well_pollution_copy
AS (
SELECT
*
FROM
md_water_services.well_pollution
);

We will get a copy of well_pollution called well_pollution_copy. Now we can make the changes, and if we discover there is a
mistake in our code, we can just delete this table, and run it again.
So if we now run our query:
UPDATE
well_pollution_copy
SET
description = 'Bacteria:E. coli'

WHERE
description = 'Clean Bacteria:E. coli';

UPDATE
well_pollution_copy
SET
description = 'Bacteria: Giardia Lamblia'

WHERE
description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
well_pollution_copy
SET
results = 'Contaminated: Biological'

WHERE
biological > 0.01 AND results = 'Clean';

We can then check if our errors are fixed using a SELECT query on the well_pollution_copy table:
SELECT
*
FROM
well_pollution_copy
WHERE
description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);

Then if we're sure it works as intended, we can change the table back to the well_pollution and delete the well_pollution_copy
table.
UPDATE
well_pollution_copy
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';
UPDATE
well_pollution_copy
SET
description = 'Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';
UPDATE
well_pollution_copy
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';
DROP TABLE
md_water_services.well_pollution_copy;
