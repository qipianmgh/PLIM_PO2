% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetChanDescr(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetChanDescr', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetChanDescr', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetChanDescr', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetChanDescr', taskHandle, channel, data);
end
