% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSwitchDevAutoConnAnlgBus(deviceName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSetSwitchDevAutoConnAnlgBus', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSwitchDevAutoConnAnlgBus', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSwitchDevAutoConnAnlgBus', deviceName, data);
end
