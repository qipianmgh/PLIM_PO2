% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgDigEdgeStartTrig(taskHandle, triggerSource, triggerEdge)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgDigEdgeStartTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgDigEdgeStartTrig', 'triggerSource', 2);
    validateattributes(triggerEdge, {'int32'}, {'scalar'}, 'DAQmxCfgDigEdgeStartTrig', 'triggerEdge', 3);
    [status]= mexNIDAQmx('DAQmxCfgDigEdgeStartTrig', taskHandle, triggerSource, triggerEdge);
end
