% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc', taskHandle);
end
