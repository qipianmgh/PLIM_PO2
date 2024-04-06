%==========================================================================
%=   FUNCTION:  BNS_CloseSLM()
%=
%=   PURPOSE:   Closes the Boulder Nonlinear Systems SLM driver boards
%=              and unloads Interface.dll from the MATLAB Workspace
%==========================================================================
function BNS_CloseSLM()
   calllib('Interface', 'Deconstructor');
   unloadlibrary('Interface');
