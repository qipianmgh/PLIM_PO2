% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgDigPatternStartTrig(taskHandle, triggerSource, triggerPattern, triggerWhen)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgDigPatternStartTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgDigPatternStartTrig', 'triggerSource', 2);
    validateattributes(triggerPattern, {'char'}, {'vector'}, 'DAQmxCfgDigPatternStartTrig', 'triggerPattern', 3);
    validateattributes(triggerWhen, {'int32'}, {'scalar'}, 'DAQmxCfgDigPatternStartTrig', 'triggerWhen', 4);
    [status]= mexNIDAQmx('DAQmxCfgDigPatternStartTrig', taskHandle, triggerSource, triggerPattern, triggerWhen);
end
