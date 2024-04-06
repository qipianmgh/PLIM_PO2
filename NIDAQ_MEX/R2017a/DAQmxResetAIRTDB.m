% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRTDB(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRTDB', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRTDB', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRTDB', taskHandle, channel);
end
