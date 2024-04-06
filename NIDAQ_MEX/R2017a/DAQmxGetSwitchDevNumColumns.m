% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevNumColumns(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevNumColumns', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSwitchDevNumColumns', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevNumColumns', deviceName, data);
end
