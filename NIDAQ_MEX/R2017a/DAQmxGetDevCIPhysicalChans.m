% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCIPhysicalChans(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCIPhysicalChans', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevCIPhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevCIPhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevCIPhysicalChans', device, data, bufferSize);
end
