% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIGPSSyncSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIGPSSyncSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIGPSSyncSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIGPSSyncSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIGPSSyncSrc', taskHandle, channel, data);
end
