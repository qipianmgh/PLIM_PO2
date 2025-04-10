% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIDataXferMech', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIDataXferMech', taskHandle, channel, data);
end
