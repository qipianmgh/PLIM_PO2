% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOOvercurrentLimit(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOOvercurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOOvercurrentLimit', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDOOvercurrentLimit', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOOvercurrentLimit', taskHandle, channel, data);
end
