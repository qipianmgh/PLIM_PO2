% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1540Cal(calHandle, refVoltage, measOutput, inputCalSource)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1540Cal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust1540Cal', 'refVoltage', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1540Cal', 'measOutput', 3);
    validateattributes(inputCalSource, {'int32'}, {'scalar'}, 'DAQmxAdjust1540Cal', 'inputCalSource', 4);
    [status]= mexNIDAQmx('DAQmxAdjust1540Cal', calHandle, refVoltage, measOutput, inputCalSource);
end
