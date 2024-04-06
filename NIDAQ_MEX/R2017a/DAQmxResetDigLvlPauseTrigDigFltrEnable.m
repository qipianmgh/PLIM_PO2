% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigLvlPauseTrigDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigLvlPauseTrigDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigLvlPauseTrigDigFltrEnable', taskHandle);
end
