% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedChangeDetectEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedChangeDetectEventPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedChangeDetectEventPulsePolarity', taskHandle, data);
end
