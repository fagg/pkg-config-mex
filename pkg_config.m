%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pkg_config - A handy interface to pkg-config when using Mex.
%
% Input:
%       - pkgName (compulsory): Name of the package.
%       - pkgconfigBin (optional): Unix path to pkg-config (default: /usr/local/bin/pkg-config)
%
% Output:
%       - incFlags: Include paths.
%       - libFlags: Libraries provided by the package.
%
% Ashton Fagg (ashton@fagg.id.au)
%
% Licensed under the WTFPL: Do whatever you like with this.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [incFlags, linkFlags] = pkg_config(varargin)
    if (nargin == 1)
        pkgconfigBin = '/usr/local/bin/pkg-config';
        pkgName = varargin{1};
    elseif (nargin == 2)
        pkgconfigBin = varargin{2};
        pkgName = varargin{1};
    else
        error('pkg_config: Invalid arguments.');
    end

    if (~exist(pkgconfigBin))
        error('pkg_config: pkg-config binary is not on path specified.');
    end

    [rc, incFlags] = unix(sprintf('%s %s --cflags', pkgconfigBin, pkgName));
    if (rc ~= 0)
        error('pkg_config: The return code indicates an error.');
    end

    [rc, linkFlags] = unix(sprintf('%s %s --libs', pkgconfigBin, pkgName));
    if (rc ~= 0)
        error('pkg_config: The return code indicates an error.');
    end
end
