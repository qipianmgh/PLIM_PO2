% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetOnDemandSimultaneousAOEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetOnDemandSimultaneousAOEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetOnDemandSimultaneousAOEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetOnDemandSimultaneousAOEnable', taskHandle, data);
end
