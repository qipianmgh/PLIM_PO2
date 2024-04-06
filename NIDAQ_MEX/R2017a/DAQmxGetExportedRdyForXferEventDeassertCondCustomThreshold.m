% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold', taskHandle, data);
end
