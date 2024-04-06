% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvTrigPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvTrigPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedAdvTrigPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvTrigPulseWidth', taskHandle, data);
end
