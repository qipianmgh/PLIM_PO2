% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCISemiPeriodTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCISemiPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCISemiPeriodTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCISemiPeriodTerm', taskHandle, channel, data, bufferSize);
end
