% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseActiveEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseActiveEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseActiveEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseActiveEdge', taskHandle, channel, data);
end
