#!/bin/bash

AWS_DEFAULT_REGION=eu-central-1 aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N12_00_E077_00_DEM/Copernicus_DSM_COG_10_N12_00_E077_00_DEM.tif ./
AWS_DEFAULT_REGION=eu-central-1 aws s3 cp --no-sign-request s3://copernicus-dem-30m/Copernicus_DSM_COG_10_N13_00_E077_00_DEM/Copernicus_DSM_COG_10_N13_00_E077_00_DEM.tif ./

gdalbuildvrt temp.vrt *tif
gdal_translate -projwin 78.2 17.6 78.6 17.2 temp.vrt dem.tif
