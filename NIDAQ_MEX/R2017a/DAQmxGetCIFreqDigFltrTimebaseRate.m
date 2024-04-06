% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIFreqDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqDigFltrTimebaseRate', taskHandle, channel, data);
end
