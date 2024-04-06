% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOOvercurrentLimit(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOOvercurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOOvercurrentLimit', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDOOvercurrentLimit', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOOvercurrentLimit', taskHandle, channel, data);
end
