% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchScanBreakMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSwitchScanBreakMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSwitchScanBreakMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchScanBreakMode', taskHandle, data);
end
