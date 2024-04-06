% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenFMDeviation(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenFMDeviation', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenFMDeviation', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOFuncGenFMDeviation', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenFMDeviation', taskHandle, channel, data);
end
