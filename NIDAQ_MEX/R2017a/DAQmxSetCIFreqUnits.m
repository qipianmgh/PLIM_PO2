% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIFreqUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqUnits', taskHandle, channel, data);
end
