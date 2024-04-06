% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIOpenThrmcplDetectEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIOpenThrmcplDetectEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIOpenThrmcplDetectEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIOpenThrmcplDetectEnable', taskHandle, channel, data);
end
