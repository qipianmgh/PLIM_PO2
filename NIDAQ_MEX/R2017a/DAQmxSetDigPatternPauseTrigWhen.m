% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigPatternPauseTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternPauseTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigPatternPauseTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigPatternPauseTrigWhen', taskHandle, data);
end
