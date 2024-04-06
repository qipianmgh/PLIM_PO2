% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDILogicFamily(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDILogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDILogicFamily', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDILogicFamily', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDILogicFamily', taskHandle, channel, data);
end
