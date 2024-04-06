% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevProductNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevProductNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevProductNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevProductNum', device, data);
end
