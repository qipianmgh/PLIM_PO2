% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOffset(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOffset', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetReadOffset', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadOffset', taskHandle, data);
end
