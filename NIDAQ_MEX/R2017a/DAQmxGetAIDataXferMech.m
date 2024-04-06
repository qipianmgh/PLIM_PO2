% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDataXferMech(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDataXferMech', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDataXferMech', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIDataXferMech', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIDataXferMech', taskHandle, channel, data);
end
