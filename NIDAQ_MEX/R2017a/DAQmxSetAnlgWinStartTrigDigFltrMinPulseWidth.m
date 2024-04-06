% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth', taskHandle, data);
end
