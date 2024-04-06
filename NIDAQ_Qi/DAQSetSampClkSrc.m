% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetSampClkSrc(taskHandle, data)
[status, data] = DAQmxSetSampClkSrc(taskHandle, char(data));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkSrc', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSampClkSrc', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxSetSampClkSrc', taskHandle, data);
end
