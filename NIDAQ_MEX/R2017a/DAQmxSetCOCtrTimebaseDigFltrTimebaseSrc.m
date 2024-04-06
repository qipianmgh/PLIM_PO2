% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc', taskHandle, channel, data);
end
