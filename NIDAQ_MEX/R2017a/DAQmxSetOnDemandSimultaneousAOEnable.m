% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetOnDemandSimultaneousAOEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetOnDemandSimultaneousAOEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetOnDemandSimultaneousAOEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetOnDemandSimultaneousAOEnable', taskHandle, data);
end
