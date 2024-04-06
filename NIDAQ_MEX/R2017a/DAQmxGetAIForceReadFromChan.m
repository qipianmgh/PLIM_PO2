% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIForceReadFromChan(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIForceReadFromChan', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIForceReadFromChan', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIForceReadFromChan', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIForceReadFromChan', taskHandle, channel, data);
end
