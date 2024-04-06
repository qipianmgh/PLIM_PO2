% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRdyForStartEventLvlActiveLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedRdyForStartEventLvlActiveLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRdyForStartEventLvlActiveLvl', taskHandle, data);
end
