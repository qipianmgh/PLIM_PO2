% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCODataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCODataXferMech', taskHandle, channel, data);
end
