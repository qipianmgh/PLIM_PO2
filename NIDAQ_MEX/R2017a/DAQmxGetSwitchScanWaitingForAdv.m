% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchScanWaitingForAdv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSwitchScanWaitingForAdv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchScanWaitingForAdv', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchScanWaitingForAdv', taskHandle, data);
end
