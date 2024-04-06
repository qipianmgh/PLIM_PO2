% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, year, month, day, hour, minute] = DAQmxGetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    narginchk(7, 7);
    nargoutchk(6, 6);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalExpDate', 'taskHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'channelName', 2);
    validateattributes(year, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'year', 3);
    validateattributes(month, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'month', 4);
    validateattributes(day, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'day', 5);
    validateattributes(hour, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'hour', 6);
    validateattributes(minute, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalExpDate', 'minute', 7);
    [status, year, month, day, hour, minute]= mexNIDAQmx('DAQmxGetAIChanCalExpDate', taskHandle, channelName, year, month, day, hour, minute);
end
