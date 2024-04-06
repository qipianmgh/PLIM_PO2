% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRdyForXferEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedRdyForXferEventLvlActiveLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRdyForXferEventLvlActiveLvl', taskHandle, data);
end
