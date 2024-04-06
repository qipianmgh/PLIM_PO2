% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIMaxMultiChanRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIMaxMultiChanRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIMaxMultiChanRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIMaxMultiChanRate', device, data);
end
