% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth', taskHandle, data);
end
