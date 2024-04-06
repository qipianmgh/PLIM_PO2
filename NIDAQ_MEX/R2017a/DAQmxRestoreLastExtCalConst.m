% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxRestoreLastExtCalConst(deviceName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxRestoreLastExtCalConst', 'deviceName', 1);
    [status]= mexNIDAQmx('DAQmxRestoreLastExtCalConst', deviceName);
end
