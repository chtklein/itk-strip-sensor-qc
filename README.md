# ITk Strip Sensor QC

How to use the QC LabVIEW scripts:
- just copy the repository to the machine used for sensor tests
- find VIs for the respective measurement & Configuration in the folder "QCtests"

The LabVIEW scripts have been developed and tested under Windows 7 using LabVIEW 2013.


Local configuration:
In "./QCtests/general_VIs/LocalConfig/QCconfig.txt" several parameters (e.g. institute name, data directories, etc.) are defined which should be changed accordingly for every setup.
The file will be automatically read when running the scripts.

Global measurement settings:
Using the Configuration VI or the text files in "./QCtests/general_VIs/globals/" default measurement settings can be changed.
However, do not alter crucial aspects of the measurement procedure during sensor QC unless approved or only if scripts are used for R&D purposes.
