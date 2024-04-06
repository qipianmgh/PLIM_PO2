% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseDutyCyc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseDutyCyc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseDutyCyc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseDutyCyc', taskHandle, channel);
end
