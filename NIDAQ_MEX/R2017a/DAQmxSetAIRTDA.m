% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRTDA(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRTDA', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRTDA', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRTDA', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRTDA', taskHandle, channel, data);
end
