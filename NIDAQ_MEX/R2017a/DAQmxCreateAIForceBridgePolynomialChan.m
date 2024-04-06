% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIForceBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'nominalBridgeResistance', 10);
    validateattributes(forwardCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'forwardCoeffs', 11);
    validateattributes(numForwardCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'numForwardCoeffs', 12);
    validateattributes(reverseCoeffs, {'double'}, {'vector'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'reverseCoeffs', 13);
    validateattributes(numReverseCoeffs, {'uint32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'numReverseCoeffs', 14);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'electricalUnits', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgePolynomialChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIForceBridgePolynomialChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName);
end
