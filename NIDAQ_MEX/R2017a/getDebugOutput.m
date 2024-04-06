% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, debugOutputOut] = getDebugOutput(debugOutputOut)
    narginchk(1, 1);
    nargoutchk(2, 2);
    validateattributes(debugOutputOut, {'uint32'}, {'vector'}, 'getDebugOutput', 'debugOutputOut', 1);
    [status, debugOutputOut]= mexNIDAQmx('getDebugOutput', debugOutputOut);
end
