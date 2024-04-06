% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenOffset(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenOffset', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenOffset', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOFuncGenOffset', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenOffset', taskHandle, channel, data);
end
