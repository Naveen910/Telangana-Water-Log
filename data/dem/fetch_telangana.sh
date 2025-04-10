#!/bin/bash

# Set AWS region
AWS_DEFAULT_REGION=eu-central-1

# Download DEM tiles for Telangana
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N15_00_E077_00_DEM/Copernicus_DSM_COG_10_N15_00_E077_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N16_00_E077_00_DEM/Copernicus_DSM_COG_10_N16_00_E077_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N17_00_E077_00_DEM/Copernicus_DSM_COG_10_N17_00_E077_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N18_00_E077_00_DEM/Copernicus_DSM_COG_10_N18_00_E077_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N19_00_E077_00_DEM/Copernicus_DSM_COG_10_N19_00_E077_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N15_00_E078_00_DEM/Copernicus_DSM_COG_10_N15_00_E078_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N16_00_E078_00_DEM/Copernicus_DSM_COG_10_N16_00_E078_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N17_00_E078_00_DEM/Copernicus_DSM_COG_10_N17_00_E078_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N18_00_E078_00_DEM/Copernicus_DSM_COG_10_N18_00_E078_00_DEM.tif ./
aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N19_00_E078_00_DEM/Copernicus_DSM_COG_10_N19_00_E078_00_DEM.tif ./

# Build a virtual raster file from all downloaded DEMs
gdalbuildvrt temp.vrt *tif

# Extract the bounding box for Telangana (approx.)
gdal_translate -projwin 77.0 19.9 81.0 15.9 temp.vrt dem_telangana.tif

# Cleanup
rm temp.vrt
