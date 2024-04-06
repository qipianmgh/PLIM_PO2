% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchWaitForSettling(deviceName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSwitchWaitForSettling', 'deviceName', 1);
    [status]= mexNIDAQmx('DAQmxSwitchWaitForSettling', deviceName);
end
