% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAODataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODataXferMech', taskHandle, channel, data);
end
