% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchScanRepeatMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSwitchScanRepeatMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSwitchScanRepeatMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchScanRepeatMode', taskHandle, data);
end
