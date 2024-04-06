% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIForceReadFromChan(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIForceReadFromChan', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIForceReadFromChan', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIForceReadFromChan', taskHandle, channel);
end
