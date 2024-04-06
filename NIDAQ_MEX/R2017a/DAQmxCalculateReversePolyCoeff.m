% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, reverseCoeffs] = DAQmxCalculateReversePolyCoeff(forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
    narginchk(7, 7);
    nargoutchk(2, 2);
    validateattributes(forwardCoeffs, {'double'}, {'vector'}, 'DAQmxCalculateReversePolyCoeff', 'forwardCoeffs', 1);
    validateattributes(numForwardCoeffsIn, {'uint32'}, {'scalar'}, 'DAQmxCalculateReversePolyCoeff', 'numForwardCoeffsIn', 2);
    validateattributes(minValX, {'double'}, {'scalar'}, 'DAQmxCalculateReversePolyCoeff', 'minValX', 3);
    validateattributes(maxValX, {'double'}, {'scalar'}, 'DAQmxCalculateReversePolyCoeff', 'maxValX', 4);
    validateattributes(numPointsToCompute, {'int32'}, {'scalar'}, 'DAQmxCalculateReversePolyCoeff', 'numPointsToCompute', 5);
    validateattributes(reversePolyOrder, {'int32'}, {'scalar'}, 'DAQmxCalculateReversePolyCoeff', 'reversePolyOrder', 6);
    validateattributes(reverseCoeffs, {'double'}, {'vector'}, 'DAQmxCalculateReversePolyCoeff', 'reverseCoeffs', 7);
    [status, reverseCoeffs]= mexNIDAQmx('DAQmxCalculateReversePolyCoeff', forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs);
end
