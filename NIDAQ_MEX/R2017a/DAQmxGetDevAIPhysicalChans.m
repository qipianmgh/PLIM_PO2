% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIPhysicalChans(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIPhysicalChans', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevAIPhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIPhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIPhysicalChans', device, data, bufferSize);
end
