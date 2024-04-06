% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIMaxSingleChanRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIMaxSingleChanRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIMaxSingleChanRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIMaxSingleChanRate', device, data);
end
