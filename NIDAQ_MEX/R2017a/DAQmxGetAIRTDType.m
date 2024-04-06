% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRTDType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRTDType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRTDType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIRTDType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRTDType', taskHandle, channel, data);
end
