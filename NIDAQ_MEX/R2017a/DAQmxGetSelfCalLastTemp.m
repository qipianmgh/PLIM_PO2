% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSelfCalLastTemp(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSelfCalLastTemp', 'deviceName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSelfCalLastTemp', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSelfCalLastTemp', deviceName, data);
end
