% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgDigEdgeRefTrig(taskHandle, triggerSource, triggerEdge, pretriggerSamples)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgDigEdgeRefTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgDigEdgeRefTrig', 'triggerSource', 2);
    validateattributes(triggerEdge, {'int32'}, {'scalar'}, 'DAQmxCfgDigEdgeRefTrig', 'triggerEdge', 3);
    validateattributes(pretriggerSamples, {'uint32'}, {'scalar'}, 'DAQmxCfgDigEdgeRefTrig', 'pretriggerSamples', 4);
    [status]= mexNIDAQmx('DAQmxCfgDigEdgeRefTrig', taskHandle, triggerSource, triggerEdge, pretriggerSamples);
end
