% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIRawDataCompressionType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIRawDataCompressionType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIRawDataCompressionType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIRawDataCompressionType', taskHandle, channel);
end
