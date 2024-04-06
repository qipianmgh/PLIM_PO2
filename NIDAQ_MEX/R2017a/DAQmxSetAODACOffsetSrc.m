% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACOffsetSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACOffsetSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACOffsetSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAODACOffsetSrc', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACOffsetSrc', taskHandle, channel, data);
end
