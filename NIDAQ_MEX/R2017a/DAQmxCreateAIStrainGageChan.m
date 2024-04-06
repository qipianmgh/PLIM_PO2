% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
    narginchk(15, 15);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIStrainGageChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIStrainGageChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'units', 6);
    validateattributes(strainConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'strainConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'voltageExcitVal', 9);
    validateattributes(gageFactor, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'gageFactor', 10);
    validateattributes(initialBridgeVoltage, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'initialBridgeVoltage', 11);
    validateattributes(nominalGageResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'nominalGageResistance', 12);
    validateattributes(poissonRatio, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'poissonRatio', 13);
    validateattributes(leadWireResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIStrainGageChan', 'leadWireResistance', 14);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIStrainGageChan', 'customScaleName', 15);
    [status]= mexNIDAQmx('DAQmxCreateAIStrainGageChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName);
end
