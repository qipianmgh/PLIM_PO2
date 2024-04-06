% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRTDB(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRTDB', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRTDB', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRTDB', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRTDB', taskHandle, channel, data);
end
