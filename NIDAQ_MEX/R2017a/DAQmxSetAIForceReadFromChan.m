% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIForceReadFromChan(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIForceReadFromChan', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIForceReadFromChan', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIForceReadFromChan', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIForceReadFromChan', taskHandle, channel, data);
end
