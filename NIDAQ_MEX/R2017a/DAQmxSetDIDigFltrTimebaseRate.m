% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDIDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDigFltrTimebaseRate', taskHandle, channel, data);
end
