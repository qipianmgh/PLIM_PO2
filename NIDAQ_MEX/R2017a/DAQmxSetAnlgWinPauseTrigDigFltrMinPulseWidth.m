% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth', taskHandle, data);
end
