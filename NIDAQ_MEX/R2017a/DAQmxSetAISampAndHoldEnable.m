% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAISampAndHoldEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAISampAndHoldEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAISampAndHoldEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAISampAndHoldEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAISampAndHoldEnable', taskHandle, channel, data);
end
