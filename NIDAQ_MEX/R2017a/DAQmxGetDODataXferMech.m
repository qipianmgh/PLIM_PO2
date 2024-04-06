% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDODataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDODataXferMech', taskHandle, channel, data);
end
