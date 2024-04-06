% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOLogicFamily(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOLogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOLogicFamily', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOLogicFamily', taskHandle, channel);
end
