% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(12, 12);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceIEPEChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceIEPEChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'units', 7);
    validateattributes(sensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'sensitivity', 8);
    validateattributes(sensitivityUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'sensitivityUnits', 9);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'currentExcitSource', 10);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceIEPEChan', 'currentExcitVal', 11);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIForceIEPEChan', 'customScaleName', 12);
    [status]= mexNIDAQmx('DAQmxCreateAIForceIEPEChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName);
end
