% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOLogicFamily(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOLogicFamily', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOLogicFamily', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOLogicFamily', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOLogicFamily', taskHandle, channel, data);
end
