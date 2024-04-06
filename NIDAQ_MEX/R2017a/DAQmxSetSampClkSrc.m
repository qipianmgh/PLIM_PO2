% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetSampClkSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSampClkSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetSampClkSrc', taskHandle, data);
end
