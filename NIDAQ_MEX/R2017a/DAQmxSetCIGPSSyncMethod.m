% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIGPSSyncMethod(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIGPSSyncMethod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIGPSSyncMethod', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIGPSSyncMethod', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIGPSSyncMethod', taskHandle, channel, data);
end
