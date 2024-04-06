% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCOPhysicalChans(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCOPhysicalChans', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevCOPhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevCOPhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevCOPhysicalChans', device, data, bufferSize);
end
