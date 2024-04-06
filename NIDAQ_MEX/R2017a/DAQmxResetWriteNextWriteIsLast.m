% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteNextWriteIsLast(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteNextWriteIsLast', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWriteNextWriteIsLast', taskHandle);
end
