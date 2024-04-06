% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOverWrite(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOverWrite', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetReadOverWrite', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOverWrite', taskHandle, data);
end
