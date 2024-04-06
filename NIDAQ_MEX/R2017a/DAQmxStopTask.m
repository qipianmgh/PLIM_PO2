% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxStopTask(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxStopTask', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxStopTask', taskHandle);
end
