function status = DAQStartTask(taskHandle)
   status = DAQmxStartTask(uint64(taskHandle));
   if status ~=0
      errorString = DAQGetExtendedErrorInfo();
      error(errorString);
   end
end

% function status = DAQStartTask(taskHandle)
%    status = DAQmxStartTask(taskHandle);
%       if status ~=0
%          errorString = DAQGetErrorString(status);
%          error(errorString);
%        % errorString = DAQGetExtendedErrorInfo();
%        % error(errorString);
%       end
% end