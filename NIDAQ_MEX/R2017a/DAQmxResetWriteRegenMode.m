% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWriteRegenMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWriteRegenMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetWriteRegenMode', taskHandle);
end
