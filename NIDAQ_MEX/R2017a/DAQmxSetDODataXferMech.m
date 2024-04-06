% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDODataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDODataXferMech', taskHandle, channel, data);
end
