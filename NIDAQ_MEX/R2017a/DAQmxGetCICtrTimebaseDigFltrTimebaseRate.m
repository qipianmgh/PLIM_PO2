% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICtrTimebaseDigFltrTimebaseRate', taskHandle, channel, data);
end
