% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIDataXferMech(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIDataXferMech', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIDataXferMech', taskHandle, channel);
end
