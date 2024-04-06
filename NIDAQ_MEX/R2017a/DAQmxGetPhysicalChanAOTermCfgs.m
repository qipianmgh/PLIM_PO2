% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAOTermCfgs(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAOTermCfgs', 'physicalChannel', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetPhysicalChanAOTermCfgs', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAOTermCfgs', physicalChannel, data);
end
