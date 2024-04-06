% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCalDevTemp(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetCalDevTemp', 'deviceName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCalDevTemp', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetCalDevTemp', deviceName, data);
end
