% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForStartEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedRdyForStartEventLvlActiveLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedRdyForStartEventLvlActiveLvl', taskHandle, data);
end
