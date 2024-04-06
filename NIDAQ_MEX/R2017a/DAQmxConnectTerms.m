% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxConnectTerms(sourceTerminal, destinationTerminal, signalModifiers)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(sourceTerminal, {'char'}, {'vector'}, 'DAQmxConnectTerms', 'sourceTerminal', 1);
    validateattributes(destinationTerminal, {'char'}, {'vector'}, 'DAQmxConnectTerms', 'destinationTerminal', 2);
    validateattributes(signalModifiers, {'int32'}, {'scalar'}, 'DAQmxConnectTerms', 'signalModifiers', 3);
    [status]= mexNIDAQmx('DAQmxConnectTerms', sourceTerminal, destinationTerminal, signalModifiers);
end
