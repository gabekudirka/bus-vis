echo Creating directories and procesisng data...

@echo off

mkdir "src/data"

mkdir "src/data/buses"

mkdir "src/data/plans"

mkdir "src/data/stationLocations"

mkdir "src/data/supplementary_data"

mapshaper "data_input/1. Network Data/1. BusRoutes_UTA/BusRoutes_UTA.dbf" "data_input/1. Network Data/1. BusRoutes_UTA/BusRoutes_UTA.prj" "data_input/1. Network Data/1. BusRoutes_UTA/BusRoutes_UTA.shp" "data_input/1. Network Data/1. BusRoutes_UTA/BusRoutes_UTA.shx" -proj wgs84 -o src/data/BusRoutes_UTA.json

mapshaper "data_input/1. Network Data/2. BusStops_UTA/BusStops_UTA.dbf" "data_input/1. Network Data/2. BusStops_UTA/BusStops_UTA.prj" "data_input/1. Network Data/2. BusStops_UTA/BusStops_UTA.shp" "data_input/1. Network Data/2. BusStops_UTA/BusStops_UTA.shx" -proj wgs84 -o src/data/BusStops_UTA.json

mapshaper "data_input/3. Supplementary Data/4. TAZ/TAZ.dbf" "data_input/3. Supplementary Data/4. TAZ/TAZ.prj" "data_input/3. Supplementary Data/4. TAZ/TAZ.shp" "data_input/3. Supplementary Data/4. TAZ/TAZ.shx" -proj wgs84 -o src/data/supplementary_data/TAZ.json

python data_processing/combine_taz_data.py

python data_processing/convert_pollutant_data.py

python data_processing/extract_bus_data.py

python data_processing/extract_plan_data.py

echo Finished