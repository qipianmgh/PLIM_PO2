% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWatchdogAttribute(taskHandle, lines, attribute)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWatchdogAttribute', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxResetWatchdogAttribute', 'lines', 2);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetWatchdogAttribute', 'attribute', 3);
    [status]= mexNIDAQmx('DAQmxResetWatchdogAttribute', taskHandle, lines, attribute);
end
