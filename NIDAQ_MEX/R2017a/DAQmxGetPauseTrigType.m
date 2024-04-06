% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPauseTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetPauseTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetPauseTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPauseTrigType', taskHandle, data);
end
