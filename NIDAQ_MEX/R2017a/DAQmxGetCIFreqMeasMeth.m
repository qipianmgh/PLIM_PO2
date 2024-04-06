% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqMeasMeth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqMeasMeth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqMeasMeth', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIFreqMeasMeth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqMeasMeth', taskHandle, channel, data);
end
