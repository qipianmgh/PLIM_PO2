% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRTDR0(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRTDR0', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRTDR0', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRTDR0', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRTDR0', taskHandle, channel, data);
end
