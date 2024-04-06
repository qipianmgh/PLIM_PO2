% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgInputBuffer(taskHandle, numSampsPerChan)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgInputBuffer', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'uint32'}, {'scalar'}, 'DAQmxCfgInputBuffer', 'numSampsPerChan', 2);
    [status]= mexNIDAQmx('DAQmxCfgInputBuffer', taskHandle, numSampsPerChan);
end
