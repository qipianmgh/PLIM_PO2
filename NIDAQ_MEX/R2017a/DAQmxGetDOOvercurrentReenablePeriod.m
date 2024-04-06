% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOOvercurrentReenablePeriod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOOvercurrentReenablePeriod', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDOOvercurrentReenablePeriod', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOOvercurrentReenablePeriod', taskHandle, channel, data);
end
