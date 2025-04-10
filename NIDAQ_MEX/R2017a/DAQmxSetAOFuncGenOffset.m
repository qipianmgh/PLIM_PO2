% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenOffset(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenOffset', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenOffset', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOFuncGenOffset', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenOffset', taskHandle, channel, data);
end
