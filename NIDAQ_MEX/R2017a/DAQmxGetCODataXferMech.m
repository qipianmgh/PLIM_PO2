% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCODataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCODataXferMech', taskHandle, channel, data);
end
