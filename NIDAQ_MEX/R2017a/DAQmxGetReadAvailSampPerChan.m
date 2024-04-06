% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadAvailSampPerChan(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadAvailSampPerChan', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadAvailSampPerChan', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadAvailSampPerChan', taskHandle, data);
end
