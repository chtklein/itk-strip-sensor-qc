<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="13008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
		<Property Name="NI.SortType" Type="Int">2</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="AlessiRel6100.lvclass" Type="LVClass" URL="../ProbeStationControl/Alessi Rel-6100/AlessiRel6100.lvclass"/>
		<Item Name="ArduinoControl.lvclass" Type="LVClass" URL="../ArduinoControl/ArduinoControl.lvclass"/>
		<Item Name="InstrControl.lvclass" Type="LVClass" URL="../InstrControl.lvclass"/>
		<Item Name="KE236.lvclass" Type="LVClass" URL="../SupplyControl/Keithley 236 &amp; 237/KE236.lvclass"/>
		<Item Name="KE487.lvclass" Type="LVClass" URL="../SupplyControl/Keithley 487/KE487.lvclass"/>
		<Item Name="KE2000.lvclass" Type="LVClass" URL="../MultimeterControl/Keithley 2000/KE2000.lvclass"/>
		<Item Name="KE2410.lvclass" Type="LVClass" URL="../SupplyControl/Keithley 2410/KE2410.lvclass"/>
		<Item Name="KE3706A.lvclass" Type="LVClass" URL="../Switching/Keithley 3706A/KE3706A.lvclass"/>
		<Item Name="KE6517.lvclass" Type="LVClass" URL="../SupplyControl/Keithley 6517/KE6517.lvclass"/>
		<Item Name="LCRControl.lvclass" Type="LVClass" URL="../LCRControl/LCRControl.lvclass"/>
		<Item Name="MultimeterControl.lvclass" Type="LVClass" URL="../MultimeterControl/MultimeterControl.lvclass"/>
		<Item Name="Pickering.lvclass" Type="LVClass" URL="../Switching/Pickering/Pickering.lvclass"/>
		<Item Name="ProbeStationControl.lvclass" Type="LVClass" URL="../ProbeStationControl/ProbeStationControl.lvclass"/>
		<Item Name="SemiProbe.lvclass" Type="LVClass" URL="../ProbeStationControl/SemiProbe/SemiProbe.lvclass"/>
		<Item Name="SupplyControl.lvclass" Type="LVClass" URL="../SupplyControl/SupplyControl.lvclass"/>
		<Item Name="Switching.lvclass" Type="LVClass" URL="../Switching/Switching.lvclass"/>
		<Item Name="WK6425.lvclass" Type="LVClass" URL="../LCRControl/WK6425/WK6425.lvclass"/>
		<Item Name="WK6440B.lvclass" Type="LVClass" URL="../LCRControl/WK6440B/WK6440B.lvclass"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Keithley 3700 Series.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Keithley 3706/Keithley 3700 Series.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="compatWriteText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatWriteText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="DDE Close Conversation.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Close Conversation.vi"/>
				<Item Name="DDE Execute.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Execute.vi"/>
				<Item Name="DDE Master Control.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Master Control.vi"/>
				<Item Name="DDE Open Conversation.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Open Conversation.vi"/>
				<Item Name="DDE Request.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Request.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Open Sessions.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/visa.llb/Open Sessions.vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subTimeDelay.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/TimeDelayBlock.llb/subTimeDelay.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write File+ (string).vi"/>
			</Item>
			<Item Name="XDNodeRunTimeDep.lvlib" Type="Library" URL="/&lt;vilib&gt;/Platform/TimedLoop/XDataNode/XDNodeRunTimeDep.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
