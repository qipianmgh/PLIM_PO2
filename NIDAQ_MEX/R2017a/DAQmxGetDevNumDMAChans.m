% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevNumDMAChans(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevNumDMAChans', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevNumDMAChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevNumDMAChans', device, data);
end
