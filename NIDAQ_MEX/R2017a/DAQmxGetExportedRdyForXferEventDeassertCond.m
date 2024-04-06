% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRdyForXferEventDeassertCond(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRdyForXferEventDeassertCond', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedRdyForXferEventDeassertCond', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRdyForXferEventDeassertCond', taskHandle, data);
end
