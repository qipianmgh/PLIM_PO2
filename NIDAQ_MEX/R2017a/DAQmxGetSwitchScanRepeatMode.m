% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchScanRepeatMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSwitchScanRepeatMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSwitchScanRepeatMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchScanRepeatMode', taskHandle, data);
end
