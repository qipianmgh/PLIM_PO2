% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseRate', taskHandle, channel, data);
end
