% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitVoltageOrCurrent(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitVoltageOrCurrent', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitVoltageOrCurrent', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIExcitVoltageOrCurrent', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitVoltageOrCurrent', taskHandle, channel, data);
end
