% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOPhysicalChans(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOPhysicalChans', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevAOPhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevAOPhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOPhysicalChans', device, data, bufferSize);
end
