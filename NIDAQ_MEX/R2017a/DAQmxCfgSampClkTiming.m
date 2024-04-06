% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgSampClkTiming', 'taskHandle', 1);
    validateattributes(source, {'char'}, {'vector'}, 'DAQmxCfgSampClkTiming', 'source', 2);
    validateattributes(rate, {'double'}, {'scalar'}, 'DAQmxCfgSampClkTiming', 'rate', 3);
    validateattributes(activeEdge, {'int32'}, {'scalar'}, 'DAQmxCfgSampClkTiming', 'activeEdge', 4);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgSampClkTiming', 'sampleMode', 5);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgSampClkTiming', 'sampsPerChan', 6);
    [status]= mexNIDAQmx('DAQmxCfgSampClkTiming', taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan);
end
