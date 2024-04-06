% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenSquareDutyCycle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenSquareDutyCycle', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOFuncGenSquareDutyCycle', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenSquareDutyCycle', taskHandle, channel, data);
end
