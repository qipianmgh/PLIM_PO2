% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOGenerateOn(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOGenerateOn', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOGenerateOn', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOGenerateOn', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOGenerateOn', taskHandle, channel, data);
end
