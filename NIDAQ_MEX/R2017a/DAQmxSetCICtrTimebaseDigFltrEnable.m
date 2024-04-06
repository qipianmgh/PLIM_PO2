% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICtrTimebaseDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICtrTimebaseDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICtrTimebaseDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCICtrTimebaseDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICtrTimebaseDigFltrEnable', taskHandle, channel, data);
end
