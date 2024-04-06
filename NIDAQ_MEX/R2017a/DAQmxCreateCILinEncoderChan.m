% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCILinEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCILinEncoderChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCILinEncoderChan', 'nameToAssignToChannel', 3);
    validateattributes(decodingType, {'int32'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'decodingType', 4);
    validateattributes(ZidxEnable, {'uint32'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'ZidxEnable', 5);
    validateattributes(ZidxVal, {'double'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'ZidxVal', 6);
    validateattributes(ZidxPhase, {'int32'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'ZidxPhase', 7);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'units', 8);
    validateattributes(distPerPulse, {'double'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'distPerPulse', 9);
    validateattributes(initialPos, {'double'}, {'scalar'}, 'DAQmxCreateCILinEncoderChan', 'initialPos', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCILinEncoderChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateCILinEncoderChan', taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName);
end
