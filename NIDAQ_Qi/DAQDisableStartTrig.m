% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQDisableStartTrig(taskHandle)
status = DAQmxDisableStartTrig(taskHandle);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(1, 1);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxDisableStartTrig', 'taskHandle', 1);
%     [status]= mexNIDAQmx('DAQmxDisableStartTrig', taskHandle);
end
