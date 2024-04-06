% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth', taskHandle, data);
end
