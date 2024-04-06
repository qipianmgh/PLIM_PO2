% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgDigEdgeAdvTrig(taskHandle, triggerSource, triggerEdge)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgDigEdgeAdvTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgDigEdgeAdvTrig', 'triggerSource', 2);
    validateattributes(triggerEdge, {'int32'}, {'scalar'}, 'DAQmxCfgDigEdgeAdvTrig', 'triggerEdge', 3);
    [status]= mexNIDAQmx('DAQmxCfgDigEdgeAdvTrig', taskHandle, triggerSource, triggerEdge);
end
