% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIVoltagedBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIVoltagedBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIVoltagedBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIVoltagedBRef', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIVoltagedBRef', taskHandle, channel, data);
end
