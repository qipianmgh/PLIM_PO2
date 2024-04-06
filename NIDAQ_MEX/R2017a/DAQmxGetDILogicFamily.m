% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDILogicFamily(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDILogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDILogicFamily', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDILogicFamily', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDILogicFamily', taskHandle, channel, data);
end
