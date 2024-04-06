% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseDigFltrTimebaseRate', taskHandle, channel, data);
end
