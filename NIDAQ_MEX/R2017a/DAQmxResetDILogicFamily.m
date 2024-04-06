% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDILogicFamily(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDILogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDILogicFamily', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDILogicFamily', taskHandle, channel);
end
