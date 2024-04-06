% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadOffset(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadOffset', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadOffset', taskHandle);
end
