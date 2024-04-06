% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadReadAllAvailSamp(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadReadAllAvailSamp', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadReadAllAvailSamp', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadReadAllAvailSamp', taskHandle, data);
end
