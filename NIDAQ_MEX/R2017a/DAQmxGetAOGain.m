% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOGain(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOGain', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOGain', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOGain', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOGain', taskHandle, channel, data);
end
