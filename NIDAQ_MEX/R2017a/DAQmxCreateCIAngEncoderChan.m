% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIAngEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIAngEncoderChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIAngEncoderChan', 'nameToAssignToChannel', 3);
    validateattributes(decodingType, {'int32'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'decodingType', 4);
    validateattributes(ZidxEnable, {'uint32'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'ZidxEnable', 5);
    validateattributes(ZidxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'ZidxVal', 6);
    validateattributes(ZidxPhase, {'int32'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'ZidxPhase', 7);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'units', 8);
    validateattributes(pulsesPerRev, {'uint32'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'pulsesPerRev', 9);
    validateattributes(initialAngle, {'double'}, {'scalar'}, 'DAQmxCreateCIAngEncoderChan', 'initialAngle', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCIAngEncoderChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateCIAngEncoderChan', taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName);
end
