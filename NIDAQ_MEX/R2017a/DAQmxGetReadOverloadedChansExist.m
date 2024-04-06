% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOverloadedChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOverloadedChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadOverloadedChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOverloadedChansExist', taskHandle, data);
end
