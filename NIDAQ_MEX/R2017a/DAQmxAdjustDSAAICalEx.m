% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjustDSAAICalEx(calHandle, referenceVoltage, inputsShorted)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSAAICalEx', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAICalEx', 'referenceVoltage', 2);
    validateattributes(inputsShorted, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSAAICalEx', 'inputsShorted', 3);
    [status]= mexNIDAQmx('DAQmxAdjustDSAAICalEx', calHandle, referenceVoltage, inputsShorted);
end
