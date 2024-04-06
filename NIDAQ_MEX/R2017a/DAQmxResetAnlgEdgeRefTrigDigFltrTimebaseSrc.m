% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc', taskHandle);
end
