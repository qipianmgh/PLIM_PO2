% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgBurstHandshakingTimingExportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'taskHandle', 1);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'sampleMode', 2);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'sampsPerChan', 3);
    validateattributes(sampleClkRate, {'double'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'sampleClkRate', 4);
    validateattributes(sampleClkOutpTerm, {'char'}, {'vector'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'sampleClkOutpTerm', 5);
    validateattributes(sampleClkPulsePolarity, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'sampleClkPulsePolarity', 6);
    validateattributes(pauseWhen, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'pauseWhen', 7);
    validateattributes(readyEventActiveLevel, {'int32'}, {'scalar'}, 'DAQmxCfgBurstHandshakingTimingExportClock', 'readyEventActiveLevel', 8);
    [status]= mexNIDAQmx('DAQmxCfgBurstHandshakingTimingExportClock', taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel);
end
