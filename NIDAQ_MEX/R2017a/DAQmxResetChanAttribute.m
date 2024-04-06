% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetChanAttribute(taskHandle, channel, attribute)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetChanAttribute', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetChanAttribute', 'channel', 2);
    validateattributes(attribute, {'int32'}, {'scalar'}, 'DAQmxResetChanAttribute', 'attribute', 3);
    [status]= mexNIDAQmx('DAQmxResetChanAttribute', taskHandle, channel, attribute);
end
