% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetSampClkTerm(taskHandle, bufferSize)
[status, data] = DAQmxGetSampClkTerm(taskHandle, char([0]), uint32(bufferSize));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTerm', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSampClkTerm', 'data', 2);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSampClkTerm', 'bufferSize', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetSampClkTerm', taskHandle, data, bufferSize);
end
