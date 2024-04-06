% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIADCCustomTimingMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIADCCustomTimingMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIADCCustomTimingMode', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIADCCustomTimingMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIADCCustomTimingMode', taskHandle, channel, data);
end
