% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCOCtrTimebaseSrc(taskHandle, channel)
[status, data] = DAQmxSetCOCtrTimebaseSrc(taskHandle, channel, blanks(length(channel)));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseSrc', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseSrc', 'channel', 2);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseSrc', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxSetCOCtrTimebaseSrc', taskHandle, channel, data);
end
