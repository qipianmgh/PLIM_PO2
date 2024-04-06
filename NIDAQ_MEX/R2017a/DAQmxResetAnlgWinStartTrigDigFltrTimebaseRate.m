% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate', taskHandle);
end
