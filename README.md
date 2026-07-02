# Raster.m

This repository contains a MATLAB script for analyzing raster-scan acoustic data and estimating focal characteristics from waveform measurements.

## What the script does

The script in Raster.m:

- loads several MATLAB data files containing raster-scan waveforms,
- extracts the peak voltage from each waveform,
- generates calibration curves for different input settings,
- analyzes axial scans to estimate:
  - focal position,
  - maximum amplitude,
  - focal region length.

## Supported analysis

The current workflow includes:

- calibration curves for real axial focus and programmed focus,
- axial amplitude analysis for:
  - Z focus = 30 mm,
  - Z focus = 35 mm,
  - Z focus = 25 mm at 5 W/cm².

## Data requirements

The script expects MATLAB data files (.mat) in the same folder. Each file should contain a variable named `rasterscandata`, and the script reads waveform data from that variable.

Example files used by the script include:

- `12-Jun-2026-5_RasterScan.mat`
- `12-Jun-2026-10_RasterScan.mat`
- `Programmed10_RasterScan.mat`
- `Zf30_RasterScan.mat`
- `Zf35_RasterScan.mat`
- `Zf25_RasterScan_5Wcm2.mat`

## How to run

1. Open MATLAB.
2. Change the current folder to the directory containing this repository.
3. Run:

```matlab
run('Raster.m')
```

## Notes

- The script uses hard-coded file names and parameter values such as:
  - sampling frequency: `125e6 Hz`
  - speed of sound in water: `1485 m/s`
- It is currently tailored to the provided dataset and file naming convention.
- If you use different data files, update the file names and any relevant parameters in the script.

## Expected output

Running the script generates:

- calibration plots for peak voltage versus Ispta setting,
- axial amplitude plots for the scan positions,
- focal point estimates and focal region measurements printed in the MATLAB command window.

## Future work

Possible improvements include:

- adding pressure conversion from voltage using hydrophone sensitivity,
- making the file names and parameters configurable,
- generalizing the script for additional scan datasets.
