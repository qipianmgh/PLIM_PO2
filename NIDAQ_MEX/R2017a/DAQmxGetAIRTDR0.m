% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRTDR0(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRTDR0', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRTDR0', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRTDR0', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRTDR0', taskHandle, channel, data);
end
