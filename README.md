# ITk Strip Sensor QC
=====================

> LabVIEW scripts for the ATLAS Inner Tracker Strip Sensor Quality Control

## Authors
*	Christoph Klein, Graham Greig

---------------------------------------------------------------------------------------
## Features

*	QC tests ready to be used: 
	*	IV
	*	CV
	*	inter-strip Capacitance
	*	inter-strip Resistance
	*	Striptest (still needs probeplan rotation for alignment)
	*	Current Stability (Prague box setup with DUT switching)
	
*	QA tests ready to be used:
	* Gate-controlled Diode
	

*	Local configurations specific for every QC/QA site stored in simple text file

*	Global measurement configurations according to ITk Technical Design Report (https://cds.cern.ch/record/2257755), QC document (https://edms.cern.ch/ui/file/2117065/2/ITk_Strip_Sensor_Quality_Control_Specification_Document_-_V3_08_04_2019.pdf), and QA document

*	direct feedback whether DUT passed QC/QA criteria

*	sequential IV & CV measurement scripts as done at Carleton, can be used as templates

*	implemented instruments:
	*	Keithley 2410
	*	Keithley 6517
	*	Keithley 487
	*	Keithley 236/237	(untested)
	*	WayneKerr 6440B
	*	WayneKerr 6425
	*	Keithley 2000
	*	Alessi REL-6100 probestation
	*	SemiProbe probestation
	*	Pickering Switching Matrix + MUX (for switching between measurement setups)
	*	Keithley 3706A Switching system (for switching between multiple DUTs)
	

## How to use the QC LabVIEW scripts:
*	just copy the repository to the machine used for sensor tests
*	find VIs for the respective measurement in the folder "QCtests" and "QAtests"
*	make sure there are no old VIs with the same name in memory

The LabVIEW scripts have been tested under Windows7/8/10 using LabVIEW 2013, 2014, and 2019.
I will include versions for anything in between once striptest is fully overhauled.


## Local configuration:
In "./general_VIs/LocalConfig/QCconfig.txt" several parameters (e.g. institute name, data directories, etc.) are defined which should be changed accordingly for every local setup.
The file will be automatically read when running the scripts.
*	INSTITUTE - local institute (see ITk database)
*	MANUFACTURERS - all sensor manufacturers
*	DEVICES - sensor types (short strip, R0, etc.) used at QC site; batch names according to database categories (e.g. ATLAS18SS for pre-production short-strip sensors)
*	SERIALNUMBERS - location of dbase serial numbers lookup file, example file in ./QCTests/general_VIs/database/
*	DATADIR - path to directory structure used to save measurement data files
*	BAKDIR - path to directory used to save screenshots and temporary data files for backup in the case of long-term measurements
*	USER - list of users at the local institute
*	IVRSERIES, etc. - resistors and capacitors in local setup, will be saved in corresponding measurement data headers

For instruments corresponding to already implemented instrument classes, adjust "Instrument GPIB addresses" cluster in global variable "InstrControl.lvclass:InstrumentSetup.vi" accordingly. 


## Global measurement settings:
During the setup measurement settings can be changed for ONE scan.
Using the text files in "./general_VIs/globals/" default measurement settings which will be loaded before each measurement can be changed.
However, do not alter crucial aspects of the measurement procedure during sensor QC unless approved or only if scripts are used for R&D purposes.
When changing the default instrument, enter the name in the same way as in the list of implemented instruments above.

## How to include new instrument types:
*	open "InstrControl.lvproj" from the "InstrControl" folder
*	create a new class (New -> Other Files -> Class) or copy an existing one (preferably of the same type as new instrument, e.g. supply) and then add to the project (Right-click on existing class -> Save As... -> check "add copy to InstrControl.lvproj")
*	set inheritance appropriately (Right-click on new class -> Properties -> Inheritance)
*	add/change VIs of new class and create global with instrument commands
*	test that everything works properly (example test scripts available for most implemented intruments, just copy what has been done there)
*	add instrument settings in global variable "InstrControl.lvclass:InstrumentSetup.vi"
*	add case of new instrument in "InstrControl.lvclass:InstrumentSelection.vi"
*	add tabs in "HardwareConfiguration.vi" and case in block diagram similar to existing instruments

## Multiple instances of the same instrument
*	add an additional configurations cluster with instrument settings in global "InstrControl.lvclass:InstrumentSetup.vi"
*	add GPIB address, instrument name and type (name and address need to be unique) in the respective cluster in the same global 
*	add the case and selector in "InstrControl.lvclass:InstrumentSelection.vi" with the instrument name and configurations tab in "HardwareConfiguration.vi"


## Missing LabVIEW libraries and 3rd party drivers
*	some versions of LV do not have certain libraries included
*	to date known issues arise for:
	*	DDE communication protocol (needed for Alessi probestation) -> DDE only works in 32-bit versions of LV
*	added third-party instrument drivers for:
	*	Keithley 37xx switching system (Carleton setup)
	*	Pickering IVI switch PI40IV (TRIUMF setup; currently LV2019 only)
*	copies of missing/additional libraries can be found in "./InstrControl/additional LV libraries/"
*	use of files
	*	DDE: copy dde.llb to "[LabVIEW version]/vi.lib/Platform/"
	*	Keithley 37xx: copy folder to "[LabVIEW version]/instr.lib/"
	*	PI40IV: use installer in folder