% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetReadAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetReadAttribute', taskHandle, attribute);
end
