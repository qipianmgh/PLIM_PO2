% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevNumSwitchChans(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevNumSwitchChans', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevNumSwitchChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevNumSwitchChans', deviceName, data);
end
