% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAISoundPressuredBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAISoundPressuredBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAISoundPressuredBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAISoundPressuredBRef', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAISoundPressuredBRef', taskHandle, channel, data);
end
