% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOFuncGenSquareDutyCycle(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOFuncGenSquareDutyCycle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOFuncGenSquareDutyCycle', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOFuncGenSquareDutyCycle', taskHandle, channel);
end
