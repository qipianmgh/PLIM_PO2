% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIPressureUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIPressureUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIPressureUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIPressureUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIPressureUnits', taskHandle, channel, data);
end
