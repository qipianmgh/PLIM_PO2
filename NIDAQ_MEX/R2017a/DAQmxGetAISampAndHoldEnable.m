% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAISampAndHoldEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAISampAndHoldEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAISampAndHoldEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAISampAndHoldEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAISampAndHoldEnable', taskHandle, channel, data);
end
