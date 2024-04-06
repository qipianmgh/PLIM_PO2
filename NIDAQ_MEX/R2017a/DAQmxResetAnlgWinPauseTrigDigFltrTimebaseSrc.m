% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc', taskHandle);
end
