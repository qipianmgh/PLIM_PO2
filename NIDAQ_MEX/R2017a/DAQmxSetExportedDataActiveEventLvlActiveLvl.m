% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedDataActiveEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedDataActiveEventLvlActiveLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedDataActiveEventLvlActiveLvl', taskHandle, data);
end
