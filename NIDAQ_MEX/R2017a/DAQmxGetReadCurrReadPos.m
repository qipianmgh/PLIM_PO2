% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadCurrReadPos(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadCurrReadPos', 'taskHandle', 1);
    validateattributes(data, {'uint64'}, {'vector'}, 'DAQmxGetReadCurrReadPos', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadCurrReadPos', taskHandle, data);
end
