% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOpenCurrentLoopChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOpenCurrentLoopChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadOpenCurrentLoopChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOpenCurrentLoopChansExist', taskHandle, data);
end
