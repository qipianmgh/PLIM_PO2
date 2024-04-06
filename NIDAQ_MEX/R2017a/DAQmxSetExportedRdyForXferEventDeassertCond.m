% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedRdyForXferEventDeassertCond(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventDeassertCond', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventDeassertCond', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedRdyForXferEventDeassertCond', taskHandle, data);
end
