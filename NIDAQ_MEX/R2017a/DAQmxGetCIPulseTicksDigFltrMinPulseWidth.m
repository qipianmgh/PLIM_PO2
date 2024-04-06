% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseTicksDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseTicksDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIPulseTicksDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseTicksDigFltrMinPulseWidth', taskHandle, channel, data);
end
