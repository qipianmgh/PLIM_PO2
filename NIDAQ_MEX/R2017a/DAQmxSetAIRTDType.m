% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRTDType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRTDType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRTDType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIRTDType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRTDType', taskHandle, channel, data);
end
