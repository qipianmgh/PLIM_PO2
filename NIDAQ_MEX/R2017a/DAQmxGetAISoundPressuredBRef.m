% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAISoundPressuredBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAISoundPressuredBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAISoundPressuredBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAISoundPressuredBRef', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAISoundPressuredBRef', taskHandle, channel, data);
end
