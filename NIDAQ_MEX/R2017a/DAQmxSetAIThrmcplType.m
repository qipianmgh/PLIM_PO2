% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIThrmcplType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIThrmcplType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIThrmcplType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIThrmcplType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIThrmcplType', taskHandle, channel, data);
end
