% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgChangeDetectionTiming(taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgChangeDetectionTiming', 'taskHandle', 1);
    validateattributes(risingEdgeChan, {'char'}, {'vector'}, 'DAQmxCfgChangeDetectionTiming', 'risingEdgeChan', 2);
    validateattributes(fallingEdgeChan, {'char'}, {'vector'}, 'DAQmxCfgChangeDetectionTiming', 'fallingEdgeChan', 3);
    validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgChangeDetectionTiming', 'sampleMode', 4);
    validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgChangeDetectionTiming', 'sampsPerChan', 5);
    [status]= mexNIDAQmx('DAQmxCfgChangeDetectionTiming', taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan);
end
