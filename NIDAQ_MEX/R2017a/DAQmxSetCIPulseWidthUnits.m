% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseWidthUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPulseWidthUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseWidthUnits', taskHandle, channel, data);
end
