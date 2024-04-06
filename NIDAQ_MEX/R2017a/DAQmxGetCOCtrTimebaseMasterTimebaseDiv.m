% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseMasterTimebaseDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOCtrTimebaseMasterTimebaseDiv', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseMasterTimebaseDiv', taskHandle, channel, data);
end
