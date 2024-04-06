% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAdvTrigPulseWidthUnits', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedAdvTrigPulseWidthUnits', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedAdvTrigPulseWidthUnits', taskHandle, data);
end
