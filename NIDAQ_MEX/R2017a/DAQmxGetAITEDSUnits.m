% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAITEDSUnits(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAITEDSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAITEDSUnits', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAITEDSUnits', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAITEDSUnits', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAITEDSUnits', taskHandle, channel, data, bufferSize);
end
