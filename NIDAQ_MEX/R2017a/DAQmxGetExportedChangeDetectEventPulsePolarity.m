% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedChangeDetectEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedChangeDetectEventPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedChangeDetectEventPulsePolarity', taskHandle, data);
end
