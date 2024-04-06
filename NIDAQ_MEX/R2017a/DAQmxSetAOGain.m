% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOGain(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOGain', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOGain', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOGain', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOGain', taskHandle, channel, data);
end
