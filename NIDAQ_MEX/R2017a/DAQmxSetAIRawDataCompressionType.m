% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRawDataCompressionType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRawDataCompressionType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRawDataCompressionType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIRawDataCompressionType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRawDataCompressionType', taskHandle, channel, data);
end
