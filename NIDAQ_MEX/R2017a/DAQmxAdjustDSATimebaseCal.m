% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjustDSATimebaseCal(calHandle, referenceFrequency)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSATimebaseCal', 'calHandle', 1);
    validateattributes(referenceFrequency, {'double'}, {'scalar'}, 'DAQmxAdjustDSATimebaseCal', 'referenceFrequency', 2);
    [status]= mexNIDAQmx('DAQmxAdjustDSATimebaseCal', calHandle, referenceFrequency);
end
