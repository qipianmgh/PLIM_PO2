% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventLvlActiveLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedRdyForXferEventLvlActiveLvl', taskHandle, data);
end
