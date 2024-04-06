% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgAnlgWindowRefTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgAnlgWindowRefTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgAnlgWindowRefTrig', 'triggerSource', 2);
    validateattributes(triggerWhen, {'int32'}, {'scalar'}, 'DAQmxCfgAnlgWindowRefTrig', 'triggerWhen', 3);
    validateattributes(windowTop, {'double'}, {'scalar'}, 'DAQmxCfgAnlgWindowRefTrig', 'windowTop', 4);
    validateattributes(windowBottom, {'double'}, {'scalar'}, 'DAQmxCfgAnlgWindowRefTrig', 'windowBottom', 5);
    validateattributes(pretriggerSamples, {'uint32'}, {'scalar'}, 'DAQmxCfgAnlgWindowRefTrig', 'pretriggerSamples', 6);
    [status]= mexNIDAQmx('DAQmxCfgAnlgWindowRefTrig', taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples);
end
