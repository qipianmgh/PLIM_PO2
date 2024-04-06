% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, calHandle] = DAQmxInitExtCal(deviceName, password, calHandle)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxInitExtCal', 'deviceName', 1);
    validateattributes(password, {'char'}, {'vector'}, 'DAQmxInitExtCal', 'password', 2);
    validateattributes(calHandle, {'uint32'}, {'vector'}, 'DAQmxInitExtCal', 'calHandle', 3);
    [status, calHandle]= mexNIDAQmx('DAQmxInitExtCal', deviceName, password, calHandle);
end
