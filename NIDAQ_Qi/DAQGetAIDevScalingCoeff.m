% function data = DAQGetAIDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
function data = DAQGetAIDevScalingCoeff(taskHandle, channel)
[status, data] = DAQmxGetAIDevScalingCoeff(taskHandle, channel, double([0 0 0 0]), uint32(4));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(4, 4);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDevScalingCoeff', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDevScalingCoeff', 'channel', 2);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIDevScalingCoeff', 'data', 3);
%     validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIDevScalingCoeff', 'arraySizeInElements', 4);
%     [status, data]= mexNIDAQmx('DAQmxGetAIDevScalingCoeff', taskHandle, channel, data, arraySizeInElements);
end
