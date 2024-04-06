% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAIHoldCmpltEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedAIHoldCmpltEventPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAIHoldCmpltEventPulsePolarity', taskHandle, data);
end
