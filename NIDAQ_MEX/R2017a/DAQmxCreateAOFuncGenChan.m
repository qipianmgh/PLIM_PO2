% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAOFuncGenChan(taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAOFuncGenChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAOFuncGenChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAOFuncGenChan', 'nameToAssignToChannel', 3);
    validateattributes(type, {'int32'}, {'scalar'}, 'DAQmxCreateAOFuncGenChan', 'type', 4);
    validateattributes(freq, {'double'}, {'scalar'}, 'DAQmxCreateAOFuncGenChan', 'freq', 5);
    validateattributes(amplitude, {'double'}, {'scalar'}, 'DAQmxCreateAOFuncGenChan', 'amplitude', 6);
    validateattributes(offset, {'double'}, {'scalar'}, 'DAQmxCreateAOFuncGenChan', 'offset', 7);
    [status]= mexNIDAQmx('DAQmxCreateAOFuncGenChan', taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset);
end
