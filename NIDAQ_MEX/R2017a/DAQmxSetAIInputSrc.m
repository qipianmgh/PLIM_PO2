% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIInputSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIInputSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIInputSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIInputSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAIInputSrc', taskHandle, channel, data);
end
