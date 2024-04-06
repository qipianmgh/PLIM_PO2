% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIADCTimingMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIADCTimingMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIADCTimingMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIADCTimingMode', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIADCTimingMode', taskHandle, channel, data);
end
