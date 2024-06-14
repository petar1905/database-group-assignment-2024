CREATE UNIQUE INDEX 
	search_vehicles
ON 
	vehicles (brand,model);

CREATE UNIQUE INDEX
    search_drivers
ON
    drivers(name(5));
    
CREATE UNIQUE INDEX
    search_trips_by_des
ON
    trips(end_place);
    
CREATE UNIQUE INDEX
    search_trips_by_start
ON
    trips(start_place);