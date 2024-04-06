% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetSwitchScanAttribute(taskHandle, attribute, value)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSwitchScanAttribute', 'taskHandle', 1);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxGetSwitchScanAttribute', 'attribute', 2);
    validateattributes(value, {'uint32'}, {'vector'}, 'DAQmxGetSwitchScanAttribute', 'value', 3);
    [status, value]= mexNIDAQmx('DAQmxGetSwitchScanAttribute', taskHandle, attribute, value);
end
