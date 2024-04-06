% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICtrTimebaseMasterTimebaseDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCICtrTimebaseMasterTimebaseDiv', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICtrTimebaseMasterTimebaseDiv', taskHandle, channel, data);
end
