% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, year, month, day, hour, minute] = DAQmxGetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    narginchk(7, 7);
    nargoutchk(6, 6);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalCalDate', 'taskHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'channelName', 2);
    validateattributes(year, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'year', 3);
    validateattributes(month, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'month', 4);
    validateattributes(day, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'day', 5);
    validateattributes(hour, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'hour', 6);
    validateattributes(minute, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalCalDate', 'minute', 7);
    [status, year, month, day, hour, minute]= mexNIDAQmx('DAQmxGetAIChanCalCalDate', taskHandle, channelName, year, month, day, hour, minute);
end
