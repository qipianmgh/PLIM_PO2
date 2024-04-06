% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOvercurrentChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOvercurrentChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadOvercurrentChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOvercurrentChansExist', taskHandle, data);
end
