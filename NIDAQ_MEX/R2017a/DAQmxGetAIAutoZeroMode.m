% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAutoZeroMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAutoZeroMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAutoZeroMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIAutoZeroMode', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAutoZeroMode', taskHandle, channel, data);
end
