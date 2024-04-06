% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetPauseTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetPauseTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetPauseTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetPauseTrigType', taskHandle, data);
end
