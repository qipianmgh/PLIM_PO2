% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDIDataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDataXferMech', taskHandle, channel, data);
end
