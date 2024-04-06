% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadReadAllAvailSamp(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadReadAllAvailSamp', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadReadAllAvailSamp', taskHandle);
end
