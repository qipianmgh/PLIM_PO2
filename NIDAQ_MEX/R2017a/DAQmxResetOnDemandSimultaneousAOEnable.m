% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetOnDemandSimultaneousAOEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetOnDemandSimultaneousAOEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetOnDemandSimultaneousAOEnable', taskHandle);
end