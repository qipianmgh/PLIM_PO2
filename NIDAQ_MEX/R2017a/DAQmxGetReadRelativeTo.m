% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadRelativeTo(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadRelativeTo', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetReadRelativeTo', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadRelativeTo', taskHandle, data);
end
