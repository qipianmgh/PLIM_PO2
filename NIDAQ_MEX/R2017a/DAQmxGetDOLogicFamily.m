% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOLogicFamily(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOLogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOLogicFamily', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOLogicFamily', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOLogicFamily', taskHandle, channel, data);
end
