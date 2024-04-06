% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgPipelinedSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgPipelinedSampClkTiming', 'taskHandle', 1);
    validateattributes(source, {'char'}, {'vector'}, 'DAQmxCfgPipelinedSampClkTiming', 'source', 2);
    validateattributes(rate, {'double'}, {'scalar'}, 'DAQmxCfgPipelinedSampClkTiming', 'rate', 3);
    validateattributes(activeEdge, {'int32'}, {'scalar'}, 'DAQmxCfgPipelinedSampClkTiming', 'activeEdge', 4);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgPipelinedSampClkTiming', 'sampleMode', 5);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgPipelinedSampClkTiming', 'sampsPerChan', 6);
    [status]= mexNIDAQmx('DAQmxCfgPipelinedSampClkTiming', taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan);
end
