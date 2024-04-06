% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPulseFreqTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPulseFreqTerm', taskHandle, channel, data);
end
