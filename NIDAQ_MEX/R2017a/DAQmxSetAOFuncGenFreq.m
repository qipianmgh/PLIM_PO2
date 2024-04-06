% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOFuncGenFreq', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenFreq', taskHandle, channel, data);
end
