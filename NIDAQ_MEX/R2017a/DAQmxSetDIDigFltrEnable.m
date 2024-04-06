% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDigFltrEnable', taskHandle, channel, data);
end
