% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICtrTimebaseDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICtrTimebaseDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCICtrTimebaseDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICtrTimebaseDigFltrTimebaseRate', taskHandle, channel, data);
end
