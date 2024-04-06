% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIDataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIDataXferMech', taskHandle, channel, data);
end
