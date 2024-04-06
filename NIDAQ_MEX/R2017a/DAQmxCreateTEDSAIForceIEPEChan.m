% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'units', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'currentExcitVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceIEPEChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIForceIEPEChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName);
end
