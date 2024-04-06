% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedDataActiveEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedDataActiveEventLvlActiveLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedDataActiveEventLvlActiveLvl', taskHandle, data);
end
