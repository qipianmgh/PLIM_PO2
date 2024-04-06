% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRTDC(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRTDC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRTDC', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRTDC', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRTDC', taskHandle, channel, data);
end
