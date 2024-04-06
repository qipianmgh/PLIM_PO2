% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedSampClkTimebaseOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSampClkTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedSampClkTimebaseOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedSampClkTimebaseOutputTerm', taskHandle, data);
end
