% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevProductCategory(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevProductCategory', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevProductCategory', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevProductCategory', device, data);
end
