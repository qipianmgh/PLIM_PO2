% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate', taskHandle);
end
