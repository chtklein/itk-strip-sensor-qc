# ITk Strip Sensor QC

How to use the QC LabVIEW scripts:
- just copy the repository to the machine used for sensor tests
- find VIs for the respective measurement & Configuration in the folder "QCtests"

The LabVIEW scripts have been developed and tested under Windows7 using LabVIEW 2013.


Local configuration:
In "./QCtests/general_VIs/LocalConfig/QCconfig.txt" several parameters (e.g. institute name, data directories, etc.) are defined which should be changed accordingly for every local setup.
The file will be automatically read when running the scripts.

Global measurement settings:
Using the Configuration VI or the text files in "./QCtests/general_VIs/globals/" default measurement settings can be changed.
However, do not alter crucial aspects of the measurement procedure during sensor QC unless approved or only if scripts are used for R&D purposes.

How to include new instruments:
- open "InstrControl.lvproj" from the "InstrControl" folder
- create a new class (New -> Other Files -> Class) or copy an existing one (preferably of the same type, e.g. supply, as new instrument) and then add to the project (Right-click on existing class -> Save As... -> check "add copy to InstrControl.lvproj")
- set inheritance appropriately (Right-click on new class -> Properties -> Inheritance)
- add/change VIs of new class and create global with instrument commands
- add instrument settings in global variable "InstrControl.lvclass:InstrumentSetup.vi"
- add case of new instrument in "InstrControl.lvclass:InstrumentSelection.vi"
- add tabs in "Configuration.vi" if necessary (supply)
