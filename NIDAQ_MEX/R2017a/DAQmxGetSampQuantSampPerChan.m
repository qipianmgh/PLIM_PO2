% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampQuantSampPerChan(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampQuantSampPerChan', 'taskHandle', 1);
    validateattributes(data, {'uint64'}, {'vector'}, 'DAQmxGetSampQuantSampPerChan', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampQuantSampPerChan', taskHandle, data);
end
