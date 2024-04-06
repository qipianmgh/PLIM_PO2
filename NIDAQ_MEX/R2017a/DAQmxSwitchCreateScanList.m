% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, taskHandle] = DAQmxSwitchCreateScanList(scanList, taskHandle)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scanList, {'char'}, {'vector'}, 'DAQmxSwitchCreateScanList', 'scanList', 1);
    validateattributes(taskHandle, {'uint64'}, {'vector'}, 'DAQmxSwitchCreateScanList', 'taskHandle', 2);
    [status, taskHandle]= mexNIDAQmx('DAQmxSwitchCreateScanList', scanList, taskHandle);
end
