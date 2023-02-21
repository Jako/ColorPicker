# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.5] - 2023-02-21

### Fixed

- Fix multiple ColorPicker TVs using the same configuration

## [2.0.4] - 2022-06-17

### Fixed

- Fix editing template variable properties in MODX 3.0.1

## [2.0.3] - 2022-03-01

### Fixed

- Fix the z-index in a MIGX modal

## [2.0.2] - 2022-02-19

### Added

- Remove the pre 1.0.3 ColorPicker files in the core & manager folder during the update
- Add a default value for the input format to avoid javascript errors

## [2.0.1] - 2022-02-10

### Added

- Strip the "#" prefix from the output by option

## [2.0.0] - 2022-02-05

### Breaking

- The hex template variable (default) database values are prefixed with a "#" character during the update

### Added

- Code refactoring
- Full MODX 3 compatibility
- Colorpicker on base of mdbassit/Coloris
- Define swatches in the input properties of the template variable
- Optional restrict the colorpicker to swatches
- Allow alpha values in the template variable input and output
- RGB and HSL template variable values

## [1.0.4] - 2019-08-17

### Changed

- PHP/MODX version check
- Normalized/refactored code 

## [1.0.3] - 2017-03-27

### Changed

- Package files are installed separate from the MODX core
- Styling on base of the 2.5.x manager theme

## [1.0.2] - 2012-02-01

### Changed

- Fix installation when manager directory name was changed
- Refactor for MODx Revo 2.2

## [1.0.1] - 2011-12-04

### Changed

- Escape Smarty variables in input properties template
- Update english translation
- Fix the inputs width of colorpicker

### Added

- English and french lexicons
- Output options: Hex, RGB, HSL in CSS or JSON

## [1.0.0] - 2011-11-11

### Changed

- Initial Version
