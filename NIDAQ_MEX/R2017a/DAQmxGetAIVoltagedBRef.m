% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIVoltagedBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIVoltagedBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIVoltagedBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIVoltagedBRef', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIVoltagedBRef', taskHandle, channel, data);
end
