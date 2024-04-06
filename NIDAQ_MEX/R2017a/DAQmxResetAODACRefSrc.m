% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRefSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRefSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRefSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRefSrc', taskHandle, channel);
end
