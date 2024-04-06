% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'voltageExcitVal', 8);
    validateattributes(voltageExcitFreq, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'voltageExcitFreq', 9);
    validateattributes(ACExcitWireMode, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'ACExcitWireMode', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosLVDTChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIPosLVDTChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName);
end
