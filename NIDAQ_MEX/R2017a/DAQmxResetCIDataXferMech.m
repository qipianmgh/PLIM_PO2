% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIDataXferMech(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIDataXferMech', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIDataXferMech', taskHandle, channel);
end
