% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSwitchDevSwitchChanList(deviceName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSwitchDevSwitchChanList', 'deviceName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSwitchDevSwitchChanList', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSwitchDevSwitchChanList', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSwitchDevSwitchChanList', deviceName, data, bufferSize);
end
