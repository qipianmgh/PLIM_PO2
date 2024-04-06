% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, year, month, day, hour, minute] = DAQmxGetSelfCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    narginchk(6, 6);
    nargoutchk(6, 6);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'deviceName', 1);
    validateattributes(year, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'year', 2);
    validateattributes(month, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'month', 3);
    validateattributes(day, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'day', 4);
    validateattributes(hour, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'hour', 5);
    validateattributes(minute, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalLastDateAndTime', 'minute', 6);
    [status, year, month, day, hour, minute]= mexNIDAQmx('DAQmxGetSelfCalLastDateAndTime', deviceName, year, month, day, hour, minute);
end
