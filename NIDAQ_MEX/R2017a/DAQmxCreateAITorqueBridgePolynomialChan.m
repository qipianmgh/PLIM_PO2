% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAITorqueBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'nominalBridgeResistance', 10);
    validateattributes(forwardCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'forwardCoeffs', 11);
    validateattributes(numForwardCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'numForwardCoeffs', 12);
    validateattributes(reverseCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'reverseCoeffs', 13);
    validateattributes(numReverseCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'numReverseCoeffs', 14);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'electricalUnits', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgePolynomialChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAITorqueBridgePolynomialChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName);
end
