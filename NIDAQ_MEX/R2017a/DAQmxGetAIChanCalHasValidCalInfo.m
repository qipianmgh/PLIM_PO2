% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalHasValidCalInfo(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalHasValidCalInfo', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalHasValidCalInfo', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalHasValidCalInfo', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalHasValidCalInfo', taskHandle, channel, data);
end
