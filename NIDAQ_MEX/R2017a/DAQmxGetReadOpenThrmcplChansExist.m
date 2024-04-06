% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOpenThrmcplChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOpenThrmcplChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadOpenThrmcplChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOpenThrmcplChansExist', taskHandle, data);
end
