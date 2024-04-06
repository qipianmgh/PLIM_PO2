% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadTotalSampPerChanAcquired(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadTotalSampPerChanAcquired', 'taskHandle', 1);
    validateattributes(data, {'uint64'}, {'vector'}, 'DAQmxGetReadTotalSampPerChanAcquired', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadTotalSampPerChanAcquired', taskHandle, data);
end
