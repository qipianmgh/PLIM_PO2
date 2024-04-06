% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjustDSAAICal(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSAAICal', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAICal', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxAdjustDSAAICal', calHandle, referenceVoltage);
end
