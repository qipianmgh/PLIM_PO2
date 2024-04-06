% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigPatternRefTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternRefTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigPatternRefTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigPatternRefTrigWhen', taskHandle, data);
end
