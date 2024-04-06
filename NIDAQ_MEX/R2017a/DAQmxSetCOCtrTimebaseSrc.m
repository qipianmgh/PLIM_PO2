% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCOCtrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCOCtrTimebaseSrc', taskHandle, channel, data);
end
