% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgAnlgEdgeRefTrig(taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgAnlgEdgeRefTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgAnlgEdgeRefTrig', 'triggerSource', 2);
    validateattributes(triggerSlope, {'int32'}, {'scalar'}, 'DAQmxCfgAnlgEdgeRefTrig', 'triggerSlope', 3);
    validateattributes(triggerLevel, {'double'}, {'scalar'}, 'DAQmxCfgAnlgEdgeRefTrig', 'triggerLevel', 4);
    validateattributes(pretriggerSamples, {'uint32'}, {'scalar'}, 'DAQmxCfgAnlgEdgeRefTrig', 'pretriggerSamples', 5);
    [status]= mexNIDAQmx('DAQmxCfgAnlgEdgeRefTrig', taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples);
end
