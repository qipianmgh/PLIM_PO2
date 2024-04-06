% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDevice(deviceName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxResetDevice', 'deviceName', 1);
    [status]= mexNIDAQmx('DAQmxResetDevice', deviceName);
end
