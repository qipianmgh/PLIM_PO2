% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIEncoderAInputTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderAInputTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderAInputTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIEncoderAInputTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIEncoderAInputTerm', taskHandle, channel, data);
end
