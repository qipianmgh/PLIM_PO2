% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevAutoConnAnlgBus(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevAutoConnAnlgBus', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevAutoConnAnlgBus', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevAutoConnAnlgBus', deviceName, data);
end
