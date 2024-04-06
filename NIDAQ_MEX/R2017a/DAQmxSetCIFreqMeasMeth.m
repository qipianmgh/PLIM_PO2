% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqMeasMeth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqMeasMeth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqMeasMeth', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIFreqMeasMeth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqMeasMeth', taskHandle, channel, data);
end
