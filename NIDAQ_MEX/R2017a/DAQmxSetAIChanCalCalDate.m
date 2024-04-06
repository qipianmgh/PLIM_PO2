% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'taskHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetAIChanCalCalDate', 'channelName', 2);
    validateattributes(year, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'year', 3);
    validateattributes(month, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'month', 4);
    validateattributes(day, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'day', 5);
    validateattributes(hour, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'hour', 6);
    validateattributes(minute, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalCalDate', 'minute', 7);
    [status]= mexNIDAQmx('DAQmxSetAIChanCalCalDate', taskHandle, channelName, year, month, day, hour, minute);
end
