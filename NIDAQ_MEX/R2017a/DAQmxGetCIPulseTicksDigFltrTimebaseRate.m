% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseTicksDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseTicksDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIPulseTicksDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseTicksDigFltrTimebaseRate', taskHandle, channel, data);
end
