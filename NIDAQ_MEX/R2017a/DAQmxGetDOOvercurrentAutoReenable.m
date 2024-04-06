% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOOvercurrentAutoReenable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOOvercurrentAutoReenable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOOvercurrentAutoReenable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOOvercurrentAutoReenable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOOvercurrentAutoReenable', taskHandle, channel, data);
end
