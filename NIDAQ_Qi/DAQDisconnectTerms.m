function status = DAQDisconnectTerms(sourceTerminal, destinationTerminal)
status = DAQmxDisconnectTerms(sourceTerminal, destinationTerminal);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(sourceTerminal, {'char'}, {'vector'}, 'DAQmxDisconnectTerms', 'sourceTerminal', 1);
%     validateattributes(destinationTerminal, {'char'}, {'vector'}, 'DAQmxDisconnectTerms', 'destinationTerminal', 2);
%     [status]= mexNIDAQmx('DAQmxDisconnectTerms', sourceTerminal, destinationTerminal);

end
