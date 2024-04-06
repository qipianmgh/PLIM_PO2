% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = setDebugOutput(debugOutputIn)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(debugOutputIn, {'uint32'}, {'scalar'}, 'setDebugOutput', 'debugOutputIn', 1);
    [status]= mexNIDAQmx('setDebugOutput', debugOutputIn);
end
