% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRefExtSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRefExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRefExtSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRefExtSrc', taskHandle, channel);
end
