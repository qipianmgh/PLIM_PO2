% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'taskHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetAIChanCalExpDate', 'channelName', 2);
    validateattributes(year, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'year', 3);
    validateattributes(month, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'month', 4);
    validateattributes(day, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'day', 5);
    validateattributes(hour, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'hour', 6);
    validateattributes(minute, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalExpDate', 'minute', 7);
    [status]= mexNIDAQmx('DAQmxSetAIChanCalExpDate', taskHandle, channelName, year, month, day, hour, minute);
end
