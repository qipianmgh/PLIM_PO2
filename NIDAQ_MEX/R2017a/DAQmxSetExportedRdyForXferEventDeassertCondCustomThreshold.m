% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold', taskHandle, data);
end
