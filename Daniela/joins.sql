SELECT
  busses.plate_nr,
  busses.driver_name,
  routes.route_km,
  bus_stations.city_name,
  bus_stations.station_address
FROM busses
 RIGHT JOIN routes
  ON busses.busroute_id = routes.bus_id
 RIGHT JOIN bus_stations
  ON routes.route_source = bus_stations.station_id;