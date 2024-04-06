% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1141Cal(calHandle, refVoltage, measOutput)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1141Cal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust1141Cal', 'refVoltage', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1141Cal', 'measOutput', 3);
    [status]= mexNIDAQmx('DAQmxAdjust1141Cal', calHandle, refVoltage, measOutput);
end
