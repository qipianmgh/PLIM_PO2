% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAITorqueUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAITorqueUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAITorqueUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAITorqueUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAITorqueUnits', taskHandle, channel, data);
end
