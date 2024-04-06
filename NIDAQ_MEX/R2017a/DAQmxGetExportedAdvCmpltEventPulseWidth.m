% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvCmpltEventPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvCmpltEventPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedAdvCmpltEventPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvCmpltEventPulseWidth', taskHandle, data);
end
