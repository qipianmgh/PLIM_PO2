% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOOutputType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOOutputType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOOutputType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOOutputType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOOutputType', taskHandle, channel, data);
end
