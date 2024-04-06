% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedPauseTrigLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedPauseTrigLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedPauseTrigLvlActiveLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedPauseTrigLvlActiveLvl', taskHandle, data);
end
