% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAOCustomScaleName(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOCustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOCustomScaleName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAOCustomScaleName', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAOCustomScaleName', taskHandle, channel, data);
end
