% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternRefTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternRefTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDigPatternRefTrigWhen', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternRefTrigWhen', taskHandle, data);
end
