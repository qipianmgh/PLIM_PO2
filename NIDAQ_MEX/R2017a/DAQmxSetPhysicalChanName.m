% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetPhysicalChanName(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetPhysicalChanName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetPhysicalChanName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetPhysicalChanName', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetPhysicalChanName', taskHandle, channel, data);
end
