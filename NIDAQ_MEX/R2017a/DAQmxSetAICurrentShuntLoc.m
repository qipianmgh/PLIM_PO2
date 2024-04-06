% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAICurrentShuntLoc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICurrentShuntLoc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICurrentShuntLoc', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAICurrentShuntLoc', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAICurrentShuntLoc', taskHandle, channel, data);
end
