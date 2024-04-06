% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth', taskHandle, channel, data);
end
