SELECT DISTINCT(athlete_id) FROM 
events E, records R
WHERE E.id = R.event_id
AND sport = 'Golf'