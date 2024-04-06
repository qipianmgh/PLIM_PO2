% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigitalLogicFamilyPowerUpState(deviceName, logicFamily)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSetDigitalLogicFamilyPowerUpState', 'deviceName', 1);
    validateattributes(logicFamily, {'int32'}, {'scalar'}, 'DAQmxSetDigitalLogicFamilyPowerUpState', 'logicFamily', 2);
    [status]= mexNIDAQmx('DAQmxSetDigitalLogicFamilyPowerUpState', deviceName, logicFamily);
end
