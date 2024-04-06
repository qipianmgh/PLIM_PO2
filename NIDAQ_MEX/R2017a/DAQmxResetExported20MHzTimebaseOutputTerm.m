% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExported20MHzTimebaseOutputTerm(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExported20MHzTimebaseOutputTerm', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExported20MHzTimebaseOutputTerm', taskHandle);
end
