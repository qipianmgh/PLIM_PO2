% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPressureBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'nominalBridgeResistance', 10);
    validateattributes(forwardCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'forwardCoeffs', 11);
    validateattributes(numForwardCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'numForwardCoeffs', 12);
    validateattributes(reverseCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'reverseCoeffs', 13);
    validateattributes(numReverseCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'numReverseCoeffs', 14);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'electricalUnits', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgePolynomialChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIPressureBridgePolynomialChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName);
end
