% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTableScale(name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(name, {'char'}, {'vector'}, 'DAQmxCreateTableScale', 'name', 1);
    validateattributes(prescaledVals, {'double'}, {'vector'}, 'DAQmxCreateTableScale', 'prescaledVals', 2);
    validateattributes(numPrescaledValsIn, {'uint32'}, {'scalar'}, 'DAQmxCreateTableScale', 'numPrescaledValsIn', 3);
    validateattributes(scaledVals, {'double'}, {'vector'}, 'DAQmxCreateTableScale', 'scaledVals', 4);
    validateattributes(numScaledValsIn, {'uint32'}, {'scalar'}, 'DAQmxCreateTableScale', 'numScaledValsIn', 5);
    validateattributes(preScaledUnits, {'int32'}, {'scalar'}, 'DAQmxCreateTableScale', 'preScaledUnits', 6);
    validateattributes(scaledUnits, {'char'}, {'vector'}, 'DAQmxCreateTableScale', 'scaledUnits', 7);
    [status]= mexNIDAQmx('DAQmxCreateTableScale', name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits);
end
