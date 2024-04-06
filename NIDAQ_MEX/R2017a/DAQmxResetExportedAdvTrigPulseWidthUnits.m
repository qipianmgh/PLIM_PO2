% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedAdvTrigPulseWidthUnits(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedAdvTrigPulseWidthUnits', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedAdvTrigPulseWidthUnits', taskHandle);
end
