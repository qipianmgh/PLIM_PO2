% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExtCalLastTemp(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetExtCalLastTemp', 'deviceName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExtCalLastTemp', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExtCalLastTemp', deviceName, data);
end
