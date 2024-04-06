% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth', taskHandle, data);
end
