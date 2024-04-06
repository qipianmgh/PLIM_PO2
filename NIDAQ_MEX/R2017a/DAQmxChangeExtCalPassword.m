% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxChangeExtCalPassword(deviceName, password, newPassword)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxChangeExtCalPassword', 'deviceName', 1);
    validateattributes(password, {'char'}, {'vector'}, 'DAQmxChangeExtCalPassword', 'password', 2);
    validateattributes(newPassword, {'char'}, {'vector'}, 'DAQmxChangeExtCalPassword', 'newPassword', 3);
    [status]= mexNIDAQmx('DAQmxChangeExtCalPassword', deviceName, password, newPassword);
end
