% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedAdvCmpltEventDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAdvCmpltEventDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetExportedAdvCmpltEventDelay', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedAdvCmpltEventDelay', taskHandle, data);
end
