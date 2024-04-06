% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseFreqDigFltrTimebaseRate', taskHandle, channel, data);
end
