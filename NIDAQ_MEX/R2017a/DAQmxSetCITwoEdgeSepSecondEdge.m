% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepSecondEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepSecondEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepSecondEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepSecondEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepSecondEdge', taskHandle, channel, data);
end
