% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadChangeDetectHasOverflowed(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadChangeDetectHasOverflowed', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadChangeDetectHasOverflowed', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadChangeDetectHasOverflowed', taskHandle, data);
end
