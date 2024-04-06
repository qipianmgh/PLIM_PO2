function status = DAQWriteAnalogScalarF64(taskHandle, autoStart, value)
[status, reserved] = DAQmxWriteAnalogScalarF64(taskHandle, uint32(autoStart), double(-1), double(value), uint32(0));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(5, 5);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteAnalogScalarF64', 'taskHandle', 1);
%     validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteAnalogScalarF64', 'autoStart', 2);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteAnalogScalarF64', 'timeout', 3);
%     validateattributes(value, {'double'}, {'scalar'}, 'DAQmxWriteAnalogScalarF64', 'value', 4);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteAnalogScalarF64', 'reserved', 5);
%     [status, reserved]= mexNIDAQmx('DAQmxWriteAnalogScalarF64', taskHandle, autoStart, timeout, value, reserved);
end