% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigLvlPauseTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigLvlPauseTrigWhen', taskHandle, data);
end
