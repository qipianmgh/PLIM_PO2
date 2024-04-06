% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseDigFltrEnable', taskHandle, channel, data);
end
