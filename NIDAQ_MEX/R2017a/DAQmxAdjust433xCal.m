% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust433xCal(calHandle, refVoltage, refExcitation, shuntLocation)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust433xCal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust433xCal', 'refVoltage', 2);
    validateattributes(refExcitation, {'double'}, {'scalar'}, 'DAQmxAdjust433xCal', 'refExcitation', 3);
    validateattributes(shuntLocation, {'int32'}, {'scalar'}, 'DAQmxAdjust433xCal', 'shuntLocation', 4);
    [status]= mexNIDAQmx('DAQmxAdjust433xCal', calHandle, refVoltage, refExcitation, shuntLocation);
end
