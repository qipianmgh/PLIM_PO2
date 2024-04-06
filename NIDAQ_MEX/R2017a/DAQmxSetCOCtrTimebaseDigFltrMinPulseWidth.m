% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth', taskHandle, channel, data);
end
