% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDIDataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIDataXferMech', taskHandle, channel, data);
end
