% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIADCTimingMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIADCTimingMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIADCTimingMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIADCTimingMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIADCTimingMode', taskHandle, channel, data);
end
