% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseDigFltrEnable', taskHandle, channel, data);
end
