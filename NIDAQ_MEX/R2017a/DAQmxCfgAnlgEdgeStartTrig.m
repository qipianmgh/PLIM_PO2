% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCfgAnlgEdgeStartTrig(taskHandle, triggerSource, triggerSlope, triggerLevel)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgAnlgEdgeStartTrig', 'taskHandle', 1);
    validateattributes(triggerSource, {'char'}, {'vector'}, 'DAQmxCfgAnlgEdgeStartTrig', 'triggerSource', 2);
    validateattributes(triggerSlope, {'int32'}, {'scalar'}, 'DAQmxCfgAnlgEdgeStartTrig', 'triggerSlope', 3);
    validateattributes(triggerLevel, {'double'}, {'scalar'}, 'DAQmxCfgAnlgEdgeStartTrig', 'triggerLevel', 4);
    [status]= mexNIDAQmx('DAQmxCfgAnlgEdgeStartTrig', taskHandle, triggerSource, triggerSlope, triggerLevel);
end
