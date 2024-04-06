% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAddGlobalChansToTask(taskHandle, channelNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxAddGlobalChansToTask', 'taskHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxAddGlobalChansToTask', 'channelNames', 2);
    [status]= mexNIDAQmx('DAQmxAddGlobalChansToTask', taskHandle, channelNames);
end
