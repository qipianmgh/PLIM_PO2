% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIFreqTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIFreqTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIFreqTerm', taskHandle, channel, data);
end
