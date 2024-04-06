% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAITermCfgs(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAITermCfgs', 'physicalChannel', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetPhysicalChanAITermCfgs', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAITermCfgs', physicalChannel, data);
end
