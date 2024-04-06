% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAutoZeroMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAutoZeroMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAutoZeroMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIAutoZeroMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAutoZeroMode', taskHandle, channel, data);
end
