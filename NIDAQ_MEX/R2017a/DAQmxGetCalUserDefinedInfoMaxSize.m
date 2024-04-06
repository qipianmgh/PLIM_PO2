% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCalUserDefinedInfoMaxSize(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetCalUserDefinedInfoMaxSize', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCalUserDefinedInfoMaxSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetCalUserDefinedInfoMaxSize', deviceName, data);
end
