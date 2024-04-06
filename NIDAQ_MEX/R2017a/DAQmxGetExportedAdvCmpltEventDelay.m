% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvCmpltEventDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvCmpltEventDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedAdvCmpltEventDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvCmpltEventDelay', taskHandle, data);
end
