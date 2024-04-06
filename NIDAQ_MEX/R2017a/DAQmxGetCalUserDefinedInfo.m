% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCalUserDefinedInfo(deviceName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetCalUserDefinedInfo', 'deviceName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCalUserDefinedInfo', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCalUserDefinedInfo', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCalUserDefinedInfo', deviceName, data, bufferSize);
end
