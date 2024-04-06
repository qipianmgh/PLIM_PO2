% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigAutoTriggered(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigAutoTriggered', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRefTrigAutoTriggered', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigAutoTriggered', taskHandle, data);
end
