% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenSquareDutyCycle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenSquareDutyCycle', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOFuncGenSquareDutyCycle', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenSquareDutyCycle', taskHandle, channel, data);
end
