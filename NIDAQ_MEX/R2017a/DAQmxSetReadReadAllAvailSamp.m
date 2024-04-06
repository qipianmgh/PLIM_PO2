% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadReadAllAvailSamp(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadReadAllAvailSamp', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetReadReadAllAvailSamp', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadReadAllAvailSamp', taskHandle, data);
end
