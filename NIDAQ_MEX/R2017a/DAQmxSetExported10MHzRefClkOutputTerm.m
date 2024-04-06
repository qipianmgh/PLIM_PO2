% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExported10MHzRefClkOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExported10MHzRefClkOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExported10MHzRefClkOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExported10MHzRefClkOutputTerm', taskHandle, data);
end
