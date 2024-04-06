% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigPatternStartTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternStartTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigPatternStartTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigPatternStartTrigWhen', taskHandle, data);
end
