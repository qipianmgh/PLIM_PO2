% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAODataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODataXferMech', taskHandle, channel, data);
end
