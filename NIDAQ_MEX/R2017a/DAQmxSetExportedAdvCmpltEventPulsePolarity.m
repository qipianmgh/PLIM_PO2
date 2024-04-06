% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAdvCmpltEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedAdvCmpltEventPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedAdvCmpltEventPulsePolarity', taskHandle, data);
end
