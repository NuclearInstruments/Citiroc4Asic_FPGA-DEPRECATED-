//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "c:/Xilinx/SDK/2017.4/bin;c:/Xilinx/Vivado/2017.4/ids_lite/ISE/bin/nt64;c:/Xilinx/Vivado/2017.4/ids_lite/ISE/lib/nt64;c:/Xilinx/Vivado/2017.4/bin;";
} else {
  PathVal = "c:/Xilinx/SDK/2017.4/bin;c:/Xilinx/Vivado/2017.4/ids_lite/ISE/bin/nt64;c:/Xilinx/Vivado/2017.4/ids_lite/ISE/lib/nt64;c:/Xilinx/Vivado/2017.4/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


// pre-commands:
ISETouchFile( "init_design", "begin" );
ISEStep( "vivado",
         "-log TOP_NEWCitirocDesignforDT0WReadoutsoftware.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source TOP_NEWCitirocDesignforDT0WReadoutsoftware.tcl -notrace" );





function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
