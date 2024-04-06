% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAIHoldCmpltEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedAIHoldCmpltEventPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedAIHoldCmpltEventPulsePolarity', taskHandle, data);
end
