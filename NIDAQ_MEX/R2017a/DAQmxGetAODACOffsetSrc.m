% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACOffsetSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACOffsetSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACOffsetSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAODACOffsetSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACOffsetSrc', taskHandle, channel, data);
end
