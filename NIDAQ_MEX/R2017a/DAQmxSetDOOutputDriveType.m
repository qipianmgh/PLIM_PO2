% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOOutputDriveType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOOutputDriveType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOOutputDriveType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOOutputDriveType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOOutputDriveType', taskHandle, channel, data);
end
