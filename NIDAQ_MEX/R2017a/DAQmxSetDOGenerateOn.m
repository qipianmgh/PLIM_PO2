% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOGenerateOn(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOGenerateOn', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOGenerateOn', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOGenerateOn', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOGenerateOn', taskHandle, channel, data);
end
