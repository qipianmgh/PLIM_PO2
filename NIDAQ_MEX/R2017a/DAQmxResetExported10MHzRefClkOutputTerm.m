% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExported10MHzRefClkOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExported10MHzRefClkOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExported10MHzRefClkOutputTerm', taskHandle);
end
