% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgOutputBuffer(taskHandle, numSampsPerChan)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgOutputBuffer', 'taskHandle', 1);
    validateattributes(numSampsPerChan, {'uint32'}, {'scalar'}, 'DAQmxCfgOutputBuffer', 'numSampsPerChan', 2);
    [status]= mexNIDAQmx('DAQmxCfgOutputBuffer', taskHandle, numSampsPerChan);
end
