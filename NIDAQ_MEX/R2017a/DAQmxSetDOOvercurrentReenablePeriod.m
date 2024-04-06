% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOOvercurrentReenablePeriod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOOvercurrentReenablePeriod', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDOOvercurrentReenablePeriod', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOOvercurrentReenablePeriod', taskHandle, channel, data);
end
