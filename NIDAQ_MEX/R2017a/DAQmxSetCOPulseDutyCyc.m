% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseDutyCyc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseDutyCyc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseDutyCyc', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseDutyCyc', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseDutyCyc', taskHandle, channel, data);
end
