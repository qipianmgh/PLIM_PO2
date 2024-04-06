% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchScanBreakMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSwitchScanBreakMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSwitchScanBreakMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchScanBreakMode', taskHandle, data);
end
