% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetRefClkSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefClkSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetRefClkSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetRefClkSrc', taskHandle, data);
end
