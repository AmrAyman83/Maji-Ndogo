SELECT province_name, town_name, type_of_water_source, 
	   location.location_type, number_of_people_served, visits.time_in_queue
FROM location
right join visits
ON location.location_id = visits.location_id
right join water_source
on visits.source_id = water_source.source_id
WHERE visits.visit_count = 1
limit 8;