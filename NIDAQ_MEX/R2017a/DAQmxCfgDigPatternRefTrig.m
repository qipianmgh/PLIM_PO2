% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgDigPatternRefTrig(taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgDigPatternRefTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgDigPatternRefTrig', 'triggerSource', 2);
    validateattributes(triggerPattern, {'char'}, {'vector'}, 'DAQmxCfgDigPatternRefTrig', 'triggerPattern', 3);
    validateattributes(triggerWhen, {'int32'}, {'scalar'}, 'DAQmxCfgDigPatternRefTrig', 'triggerWhen', 4);
    validateattributes(pretriggerSamples, {'uint32'}, {'scalar'}, 'DAQmxCfgDigPatternRefTrig', 'pretriggerSamples', 5);
    [status]= mexNIDAQmx('DAQmxCfgDigPatternRefTrig', taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples);
end
