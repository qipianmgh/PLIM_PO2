% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOCurrentUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOCurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOCurrentUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOCurrentUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOCurrentUnits', taskHandle, channel, data);
end
