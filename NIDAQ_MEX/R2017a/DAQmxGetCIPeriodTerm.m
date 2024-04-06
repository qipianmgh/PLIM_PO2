% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPeriodTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPeriodTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPeriodTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPeriodTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPeriodTerm', taskHandle, channel, data, bufferSize);
end
