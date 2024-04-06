% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedDataActiveEventLvlActiveLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedDataActiveEventLvlActiveLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedDataActiveEventLvlActiveLvl', taskHandle);
end
