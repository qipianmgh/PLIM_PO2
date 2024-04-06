% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevBusType(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevBusType', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevBusType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevBusType', device, data);
end
