% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRawSampJustification(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRawSampJustification', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRawSampJustification', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIRawSampJustification', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRawSampJustification', taskHandle, channel, data);
end
