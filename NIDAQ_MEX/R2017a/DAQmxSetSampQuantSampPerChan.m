% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampQuantSampPerChan(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampQuantSampPerChan', 'taskHandle', 1);
    validateattributes(data, {'uint64'}, {'scalar'}, 'DAQmxSetSampQuantSampPerChan', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampQuantSampPerChan', taskHandle, data);
end
