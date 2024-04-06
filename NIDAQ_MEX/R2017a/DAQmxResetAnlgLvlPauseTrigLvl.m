% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgLvlPauseTrigLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgLvlPauseTrigLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgLvlPauseTrigLvl', taskHandle);
end
