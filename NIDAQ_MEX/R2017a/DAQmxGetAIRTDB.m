% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRTDB(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRTDB', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRTDB', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIRTDB', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRTDB', taskHandle, channel, data);
end
