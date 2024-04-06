% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOMin', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOMin', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOMin', taskHandle, channel, data);
end
