% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedPauseTrigLvlActiveLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedPauseTrigLvlActiveLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedPauseTrigLvlActiveLvl', taskHandle);
end
