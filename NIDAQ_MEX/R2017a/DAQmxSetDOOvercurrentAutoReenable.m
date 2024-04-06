% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOOvercurrentAutoReenable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOOvercurrentAutoReenable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOOvercurrentAutoReenable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOOvercurrentAutoReenable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOOvercurrentAutoReenable', taskHandle, channel, data);
end
