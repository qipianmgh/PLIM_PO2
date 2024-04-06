% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseFreqUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPulseFreqUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseFreqUnits', taskHandle, channel, data);
end
