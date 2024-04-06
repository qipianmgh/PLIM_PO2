% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIGPSSyncMethod(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIGPSSyncMethod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIGPSSyncMethod', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIGPSSyncMethod', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIGPSSyncMethod', taskHandle, channel, data);
end
