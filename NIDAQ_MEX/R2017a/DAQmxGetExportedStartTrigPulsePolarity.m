% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedStartTrigPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedStartTrigPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedStartTrigPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedStartTrigPulsePolarity', taskHandle, data);
end
