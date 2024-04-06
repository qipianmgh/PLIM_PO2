% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetRefClkSrc(taskHandle, data, bufferSize)
[status, data] = DAQmxGetRefClkSrc(taskHandle, char(data), uint32(bufferSize));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefClkSrc', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetRefClkSrc', 'data', 2);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetRefClkSrc', 'bufferSize', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetRefClkSrc', taskHandle, data, bufferSize);
end
