% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRTDType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRTDType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRTDType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRTDType', taskHandle, channel);
end
