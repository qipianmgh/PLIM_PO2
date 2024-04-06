% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseDutyCyc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseDutyCyc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseDutyCyc', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOPulseDutyCyc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseDutyCyc', taskHandle, channel, data);
end
