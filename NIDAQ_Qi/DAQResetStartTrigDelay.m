% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQResetStartTrigDelay(taskHandle)
    status = DAQmxResetStartTrigDelay(taskHandle);
    if status ~=0
       errorString = DAQGetErrorString(status);
       error(errorString);
    end
    
%     narginchk(1, 1);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetStartTrigDelay', 'taskHandle', 1);
%     [status]= mexNIDAQmx('DAQmxResetStartTrigDelay', taskHandle);
end
