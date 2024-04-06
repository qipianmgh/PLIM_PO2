% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedAIHoldCmpltEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAIHoldCmpltEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedAIHoldCmpltEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedAIHoldCmpltEventOutputTerm', taskHandle, data);
end
