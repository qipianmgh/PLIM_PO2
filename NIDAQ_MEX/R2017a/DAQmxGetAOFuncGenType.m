% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOFuncGenType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenType', taskHandle, channel, data);
end
