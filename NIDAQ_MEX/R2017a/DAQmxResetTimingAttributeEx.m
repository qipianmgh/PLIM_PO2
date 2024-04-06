% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetTimingAttributeEx(taskHandle, deviceNames, attribute)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetTimingAttributeEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetTimingAttributeEx', 'deviceNames', 2);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetTimingAttributeEx', 'attribute', 3);
    [status]= mexNIDAQmx('DAQmxResetTimingAttributeEx', taskHandle, deviceNames, attribute);
end
