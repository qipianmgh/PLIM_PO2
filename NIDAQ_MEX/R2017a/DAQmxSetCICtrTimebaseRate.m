% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICtrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICtrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICtrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCICtrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICtrTimebaseRate', taskHandle, channel, data);
end
