% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIEncoderBInputTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderBInputTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderBInputTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIEncoderBInputTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIEncoderBInputTerm', taskHandle, channel, data);
end
