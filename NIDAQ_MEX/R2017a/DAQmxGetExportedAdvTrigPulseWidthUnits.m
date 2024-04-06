% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvTrigPulseWidthUnits', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedAdvTrigPulseWidthUnits', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvTrigPulseWidthUnits', taskHandle, data);
end
