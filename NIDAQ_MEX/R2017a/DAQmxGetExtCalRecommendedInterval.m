% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExtCalRecommendedInterval(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetExtCalRecommendedInterval', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetExtCalRecommendedInterval', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExtCalRecommendedInterval', deviceName, data);
end
