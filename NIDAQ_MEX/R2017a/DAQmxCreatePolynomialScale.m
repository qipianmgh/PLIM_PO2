% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreatePolynomialScale(name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(name, {'char'}, {'vector'}, 'DAQmxCreatePolynomialScale', 'name', 1);
    validateattributes(forwardCoeffs, {'double'}, {'vector'}, 'DAQmxCreatePolynomialScale', 'forwardCoeffs', 2);
    validateattributes(numForwardCoeffsIn, {'uint32'}, {'scalar'}, 'DAQmxCreatePolynomialScale', 'numForwardCoeffsIn', 3);
    validateattributes(reverseCoeffs, {'double'}, {'vector'}, 'DAQmxCreatePolynomialScale', 'reverseCoeffs', 4);
    validateattributes(numReverseCoeffsIn, {'uint32'}, {'scalar'}, 'DAQmxCreatePolynomialScale', 'numReverseCoeffsIn', 5);
    validateattributes(preScaledUnits, {'int32'}, {'scalar'}, 'DAQmxCreatePolynomialScale', 'preScaledUnits', 6);
    validateattributes(scaledUnits, {'char'}, {'vector'}, 'DAQmxCreatePolynomialScale', 'scaledUnits', 7);
    [status]= mexNIDAQmx('DAQmxCreatePolynomialScale', name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits);
end
