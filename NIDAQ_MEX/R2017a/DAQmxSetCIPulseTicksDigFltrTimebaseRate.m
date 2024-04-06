% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTicksDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTicksDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPulseTicksDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseTicksDigFltrTimebaseRate', taskHandle, channel, data);
end
