% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedSampClkOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSampClkOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedSampClkOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedSampClkOutputTerm', taskHandle, data);
end
