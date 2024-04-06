% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvCmpltEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedAdvCmpltEventPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvCmpltEventPulsePolarity', taskHandle, data);
end
