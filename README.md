# ITk Strip Sensor QC
=====================

> LabVIEW scripts for the ATLAS Inner Tracker Strip Sensor Quality Control

## Author
*	Christoph Klein

---------------------------------------------------------------------------------------
## Features

*	QC tests ready to be used: 
	*	IV
	*	CV
	*	inter-strip Capacitance
	*	inter-strip Resistance

*	Local configurations specific for every QC site stored in simple text file

*	Global measurement configurations according to ITk Technical Design Report (https://cds.cern.ch/record/2257755)

*	direct feedback whether DUT passed QC criteria

*	implemented instruments:
	*	Keithley 2410
	*	Keithley 6517
	*	Keithley 487
	*	Keithley 236/237	(untested)
	*	WayneKerr 6440B
	*	WayneKerr 6425
	*	Keithley 2000	(untested)
	

## How to use the QC LabVIEW scripts:
*	just copy the repository to the machine used for sensor tests
*	find VIs for the respective measurement in the folder "QCtests"
*	make sure there are no old VIs with the same name in memory

The LabVIEW scripts have been tested under Windows7/8/10 using LabVIEW 2013 + 2019.


## Local configuration:
In "./QCtests/general_VIs/LocalConfig/QCconfig.txt" several parameters (e.g. institute name, data directories, etc.) are defined which should be changed accordingly for every local setup.
The file will be automatically read when running the scripts.
*	INSTITUTE - local institute
*	MANUFACTURERS - all sensor manufacturers
*	DEVICES - sensor type (short strip, R0, etc.)
*	SERIALNUMBERS - unused at the moment, may be used later for dbase serial numbers
*	DATADIR - path to directory structure used to save measurement data files
*	BAKDIR - path to directory used to save screenshots and temporary data files for backup in the case of long-term measurements
*	USER - list of users at the local institute


## Global measurement settings:
Using the MeasurementConfiguration VI (not yet fully implemented) or the text files in "./QCtests/general_VIs/globals/" default measurement settings can be changed.
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
*	multiple instances of the same instrument (but with different GPIB addresses obviously) can be added by just creating an additional cluster with instrument settings and add GPIB address in global "InstrControl.lvclass:InstrumentSetup.vi" + adding case in "InstrControl.lvclass:InstrumentSelection.vi"
