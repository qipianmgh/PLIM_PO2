% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternStartTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternStartTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigPatternStartTrigWhen', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternStartTrigWhen', taskHandle, data);
end
