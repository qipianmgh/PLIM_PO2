% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvTrigPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvTrigPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedAdvTrigPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvTrigPulsePolarity', taskHandle, data);
end
