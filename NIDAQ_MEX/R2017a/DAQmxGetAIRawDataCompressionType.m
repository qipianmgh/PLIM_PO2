% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRawDataCompressionType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRawDataCompressionType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRawDataCompressionType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIRawDataCompressionType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRawDataCompressionType', taskHandle, channel, data);
end
