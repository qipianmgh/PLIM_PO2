% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOOutputDriveType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOOutputDriveType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOOutputDriveType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOOutputDriveType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOOutputDriveType', taskHandle, channel, data);
end
