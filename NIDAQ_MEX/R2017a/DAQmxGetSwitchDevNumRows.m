% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevNumRows(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevNumRows', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevNumRows', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevNumRows', deviceName, data);
end
