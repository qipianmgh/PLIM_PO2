% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIRTDChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIRTDChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'resistanceConfig', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIRTDChan', 'currentExcitVal', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIRTDChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal);
end
