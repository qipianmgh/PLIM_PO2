% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIGPSSyncMethod(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIGPSSyncMethod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIGPSSyncMethod', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIGPSSyncMethod', taskHandle, channel);
end
