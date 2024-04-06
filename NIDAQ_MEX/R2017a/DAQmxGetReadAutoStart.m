% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadAutoStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadAutoStart', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadAutoStart', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadAutoStart', taskHandle, data);
end
