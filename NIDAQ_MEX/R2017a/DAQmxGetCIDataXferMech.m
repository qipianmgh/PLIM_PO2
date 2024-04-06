% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIDataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIDataXferMech', taskHandle, channel, data);
end
