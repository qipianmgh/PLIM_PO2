% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSelfTestDevice(deviceName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSelfTestDevice', 'deviceName', 1);
    [status]= mexNIDAQmx('DAQmxSelfTestDevice', deviceName);
end
