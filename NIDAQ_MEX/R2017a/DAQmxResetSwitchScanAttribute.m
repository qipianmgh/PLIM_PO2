% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSwitchScanAttribute(taskHandle, attribute)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSwitchScanAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetSwitchScanAttribute', 'attribute', 2);
    [status]= mexNIDAQmx('DAQmxResetSwitchScanAttribute', taskHandle, attribute);
end
