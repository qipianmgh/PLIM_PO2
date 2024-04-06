% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevTopology(deviceName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevTopology', 'deviceName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSwitchDevTopology', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSwitchDevTopology', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevTopology', deviceName, data, bufferSize);
end
