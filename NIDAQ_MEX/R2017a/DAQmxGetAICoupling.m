% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAICoupling(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAICoupling', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAICoupling', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAICoupling', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAICoupling', taskHandle, channel, data);
end
