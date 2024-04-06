% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRTDC(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRTDC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRTDC', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRTDC', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRTDC', taskHandle, channel, data);
end
