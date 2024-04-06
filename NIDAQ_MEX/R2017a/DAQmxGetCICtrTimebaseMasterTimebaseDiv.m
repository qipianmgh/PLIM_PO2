% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseMasterTimebaseDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICtrTimebaseMasterTimebaseDiv', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICtrTimebaseMasterTimebaseDiv', taskHandle, channel, data);
end
