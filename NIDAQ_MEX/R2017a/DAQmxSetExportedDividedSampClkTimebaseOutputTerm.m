% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedDividedSampClkTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedDividedSampClkTimebaseOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedDividedSampClkTimebaseOutputTerm', taskHandle, data);
end
