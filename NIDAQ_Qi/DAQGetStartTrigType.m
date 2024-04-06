% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetStartTrigType(taskHandle)
    [status, data] = DAQmxGetStartTrigType(taskHandle, int32(0));
    if status ~=0
     % errorString = DAQGetErrorString(status);
     % error(errorString);
       errorString = DAQGetExtendedErrorInfo();
       error(errorString);
    end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigType', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetStartTrigType', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetStartTrigType', taskHandle, data);
end
