% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICtrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICtrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCICtrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICtrTimebaseRate', taskHandle, channel, data);
end
