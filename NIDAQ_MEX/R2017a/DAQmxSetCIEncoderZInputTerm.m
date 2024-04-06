% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIEncoderZInputTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderZInputTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderZInputTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIEncoderZInputTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIEncoderZInputTerm', taskHandle, channel, data);
end
