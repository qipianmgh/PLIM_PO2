% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgHandshakingTiming(taskHandle, sampleMode, sampsPerChan)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgHandshakingTiming', 'taskHandle', 1);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgHandshakingTiming', 'sampleMode', 2);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgHandshakingTiming', 'sampsPerChan', 3);
    [status]= mexNIDAQmx('DAQmxCfgHandshakingTiming', taskHandle, sampleMode, sampsPerChan);
end
