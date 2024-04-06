% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetSampClkTimebaseSrc(taskHandle, data)
[status, data] = DAQmxSetSampClkTimebaseSrc(taskHandle, char(data));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseSrc', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSampClkTimebaseSrc', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxSetSampClkTimebaseSrc', taskHandle, data);
end
