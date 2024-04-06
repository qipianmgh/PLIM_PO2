% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, year, month, day, hour, minute] = DAQmxGetExtCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    narginchk(6, 6);
    nargoutchk(6, 6);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'deviceName', 1);
    validateattributes(year, {'uint32'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'year', 2);
    validateattributes(month, {'uint32'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'month', 3);
    validateattributes(day, {'uint32'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'day', 4);
    validateattributes(hour, {'uint32'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'hour', 5);
    validateattributes(minute, {'uint32'}, {'vector'}, 'DAQmxGetExtCalLastDateAndTime', 'minute', 6);
    [status, year, month, day, hour, minute]= mexNIDAQmx('DAQmxGetExtCalLastDateAndTime', deviceName, year, month, day, hour, minute);
end
