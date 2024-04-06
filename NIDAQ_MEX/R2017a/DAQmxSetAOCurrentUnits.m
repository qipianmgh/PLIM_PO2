% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOCurrentUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOCurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOCurrentUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOCurrentUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOCurrentUnits', taskHandle, channel, data);
end
