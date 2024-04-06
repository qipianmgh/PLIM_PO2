% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgAnlgWindowStartTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgAnlgWindowStartTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgAnlgWindowStartTrig', 'triggerSource', 2);
    validateattributes(triggerWhen, {'int32'}, {'scalar'}, 'DAQmxCfgAnlgWindowStartTrig', 'triggerWhen', 3);
    validateattributes(windowTop, {'double'}, {'scalar'}, 'DAQmxCfgAnlgWindowStartTrig', 'windowTop', 4);
    validateattributes(windowBottom, {'double'}, {'scalar'}, 'DAQmxCfgAnlgWindowStartTrig', 'windowBottom', 5);
    [status]= mexNIDAQmx('DAQmxCfgAnlgWindowStartTrig', taskHandle, triggerSource, triggerWhen, windowTop, windowBottom);
end
