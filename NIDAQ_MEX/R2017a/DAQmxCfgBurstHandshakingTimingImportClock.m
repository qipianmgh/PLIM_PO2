% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgBurstHandshakingTimingImportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'taskHandle', 1);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'sampleMode', 2);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'sampsPerChan', 3);
    validateattributes(sampleClkRate, {'double'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'sampleClkRate', 4);
    validateattributes(sampleClkSrc, {'char'}, {'vector'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'sampleClkSrc', 5);
    validateattributes(sampleClkActiveEdge, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'sampleClkActiveEdge', 6);
    validateattributes(pauseWhen, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'pauseWhen', 7);
    validateattributes(readyEventActiveLevel, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingImportClock', 'readyEventActiveLevel', 8);
    [status]= mexNIDAQmx('DAQmxCfgBurstHandshakingTimingImportClock', taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel);
end
