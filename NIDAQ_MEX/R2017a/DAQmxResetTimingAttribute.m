% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetTimingAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetTimingAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetTimingAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetTimingAttribute', taskHandle, attribute);
end
