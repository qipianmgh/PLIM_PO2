% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxTristateOutputTerm(outputTerminal)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(outputTerminal, {'char'}, {'vector'}, 'DAQmxTristateOutputTerm', 'outputTerminal', 1);
    [status]= mexNIDAQmx('DAQmxTristateOutputTerm', outputTerminal);
end
