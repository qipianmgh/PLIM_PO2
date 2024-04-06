% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1521Cal(calHandle, refVoltage, measOutput)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1521Cal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust1521Cal', 'refVoltage', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1521Cal', 'measOutput', 3);
    [status]= mexNIDAQmx('DAQmxAdjust1521Cal', calHandle, refVoltage, measOutput);
end
