% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAODACOffsetExtSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACOffsetExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACOffsetExtSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAODACOffsetExtSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAODACOffsetExtSrc', taskHandle, channel, data);
end
