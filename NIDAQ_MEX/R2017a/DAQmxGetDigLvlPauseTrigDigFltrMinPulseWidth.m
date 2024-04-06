% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth', taskHandle, data);
end
