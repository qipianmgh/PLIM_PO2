% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseMasterTimebaseDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseMasterTimebaseDiv', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseMasterTimebaseDiv', taskHandle, channel, data);
end
