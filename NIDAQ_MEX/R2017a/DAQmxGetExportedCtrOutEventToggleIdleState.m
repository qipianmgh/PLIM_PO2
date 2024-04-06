% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedCtrOutEventToggleIdleState(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedCtrOutEventToggleIdleState', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedCtrOutEventToggleIdleState', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedCtrOutEventToggleIdleState', taskHandle, data);
end
