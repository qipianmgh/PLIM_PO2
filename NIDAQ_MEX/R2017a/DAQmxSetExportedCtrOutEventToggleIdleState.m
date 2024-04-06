% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedCtrOutEventToggleIdleState(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventToggleIdleState', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventToggleIdleState', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedCtrOutEventToggleIdleState', taskHandle, data);
end
