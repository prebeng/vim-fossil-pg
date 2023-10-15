" Vim plugin for interacting with Fossil (https://fossil-scm.org).
" Maintainer:	Preben Guldberg <preben@guldberg.org>
" Last Change:	2023 Oct 15
" License:      MIT

vim9script

if exists('g:loaded_fossil') || &cp
  finish
endif
g:loaded_fossil = 1

# To update FossilArgs below, copy all lines inside the if/endif and execute
# them as a register.
if 0
    :legacy let _FossilArgs_commands_ =<< trim EOI
    :silent g/^FossilArgs\[.* = FossilArgs\[/d  " Remove aliases
    :silent g/^var FossilArgs = {/,/^}/d        " Remove dictionary
    :aboveleft SFossil help -a -v               " Split and run fossil help
    :g/^This is fossil version/s/^/### /        " Use fossil version as marker
    :g/\%(^# .*\n\)\@<=# /s/ //|-t.|-j!|m$      " Prepare for aliases (first!)
    :v/^#\|^ \+-\S\+\%( \S\+\)\=  /d            " Keep command and option lines
    :g/^ /s/^ *\(-\S\+\) .*/'\1',/|s/|/',\r'/e  " Prepare options for a list
    :0put='var FossilArgs = {'                  " Start of dictionary
    :g/^# //^#/put!='],'|?^# \(\S\+\)?s//'\1': [/|s/\[\n\]/[]/e   " key: [list]
    :g/\[$/put='X'|.,/^]/-sort|/^]/?^X?d        " Sort options (--x before -x)
    :g/^###/t1|s/## / /                         " Include version information
    :/^###/s/.*/}/                              " End of dictionary
    :%s/^#\([^#]\+\)# \(.*\)/FossilArgs['\1'] = FossilArgs['\2']/   " Aliases
    :g/^[#'\]]/s/^/    /                        " Indent dictionary content
    :g/^ *'-/s/^/    /                          " Indent lists of options
    :%y
    :close
    :put!
EOI
    :for cmd in _FossilArgs_commands_ | exec cmd | endfor
endif

var FossilArgs = {
    # This is fossil version 2.23 [593e801bdf] 2023-09-29 13:35:55 UTC
    '3-way-merge': [],
    'add': [
        '--allow-reserved',
        '--case-sensitive',
        '--clean',
        '--dotfiles',
        '--dry-run',
        '--force',
        '--ignore',
        '--reset',
        '--verbose',
        '-f',
        '-n',
        '-v',
    ],
    'addremove': [
        '--case-sensitive',
        '--clean',
        '--dotfiles',
        '--dry-run',
        '--ignore',
        '--reset',
        '--verbose',
        '-n',
        '-v',
    ],
    'alerts': [
        '--body',
        '--digest',
        '--renewal',
        '--smtp-trace',
        '--stdout',
        '--subject',
        '--test',
        '-S',
    ],
    'all': [
        '--dry-run',
        '--showfile',
        '--stop-on-error',
    ],
    'amend': [
        '--author',
        '--bgcolor',
        '--branch',
        '--branchcolor',
        '--cancel',
        '--close',
        '--comment',
        '--date',
        '--date-override',
        '--dry-run',
        '--edit-comment',
        '--hide',
        '--message-file',
        '--tag',
        '--user-override',
        '-M',
        '-e',
        '-m',
        '-n',
    ],
    'annotate': [
        '--filevers',
        '--ignore-all-space',
        '--ignore-trailing-space',
        '--limit',
        '--log',
        '--origin',
        '--revision',
        '-Z',
        '-l',
        '-n',
        '-o',
        '-r',
        '-w',
    ],
    'artifact': [
        '--repository',
        '-R',
    ],
    'attachment': [
        '--technote',
        '--technote',
        '-t',
        '-t',
    ],
    'backoffice': [
        '--debug',
        '--logfile',
        '--min',
        '--nodelay',
        '--nolease',
        '--poll',
        '--trace',
    ],
    'backup': [
        '--overwrite',
        '-R',
    ],
    'bisect': [
        '--interactive',
        '-i',
    ],
    'branch': [
        '--all',
        '--bgcolor',
        '--closed',
        '--date-override',
        '--date-override',
        '--dry-run',
        '--merged',
        '--nosign',
        '--private',
        '--repository',
        '--self',
        '--unmerged',
        '--user-override',
        '--user-override',
        '--username',
        '--users',
        '--verbose',
        '-M',
        '-R',
        '-a',
        '-c',
        '-m',
        '-n',
        '-p',
        '-r',
        '-t',
        '-v',
    ],
    'bundle': [
        '--branch',
        '--checkin',
        '--standalone',
    ],
    'cache': [],
    'cat': [
        '--out',
        '--repository',
        '-R',
        '-o',
        '-r',
    ],
    'cgi': [],
    'changes': [
        '--abs-paths',
        '--added',
        '--all',
        '--case-sensitive',
        '--changed',
        '--classify',
        '--conflict',
        '--deleted',
        '--differ',
        '--dotfiles',
        '--edited',
        '--extra',
        '--hash',
        '--header',
        '--ignore',
        '--merge',
        '--meta',
        '--missing',
        '--no-classify',
        '--no-merge',
        '--rel-paths',
        '--renamed',
        '--unchanged',
        '--updated',
        '--verbose',
        '-v',
    ],
    'chat': [
        '--all',
        '--as',
        '--debug',
        '--file',
        '--message',
        '--out',
        '--remote',
        '--unsafe',
        '--unsafe',
        '-f',
        '-m',
    ],
    'checkout': [
        '--force',
        '--force-missing',
        '--keep',
        '--setmtime',
    ],
    'cherry-pick': [
        '--backout',
        '--baseline',
        '--binary',
        '--cherrypick',
        '--dry-run',
        '--force',
        '--force-missing',
        '--integrate',
        '--keep-merge-files',
        '--verbose',
        '-K',
        '-f',
        '-n',
        '-v',
    ],
    'clean': [
        '--allckouts',
        '--case-sensitive',
        '--clean',
        '--dirsonly',
        '--disable-undo',
        '--dotfiles',
        '--dry-run',
        '--emptydirs',
        '--force',
        '--ignore',
        '--keep',
        '--no-prompt',
        '--prompt',
        '--temp',
        '--verbose',
        '--verily',
        '-f',
        '-i',
        '-n',
        '-v',
        '-x',
    ],
    'clone': [
        '--admin-user',
        '--httpauth',
        '--nested',
        '--no-open',
        '--nocompress',
        '--once',
        '--private',
        '--save-http-password',
        '--ssh-command',
        '--ssl-identity',
        '--transport-command',
        '--unversioned',
        '--verbose',
        '--workdir',
        '-A',
        '-B',
        '-c',
        '-u',
        '-v',
    ],
    'close': [
        '--force',
        '-f',
    ],
    'commit': [
        '--allow-conflict',
        '--allow-empty',
        '--allow-fork',
        '--allow-older',
        '--baseline',
        '--bgcolor',
        '--branch',
        '--branchcolor',
        '--close',
        '--comment',
        '--date-override',
        '--delta',
        '--dry-run',
        '--hash',
        '--ignore-clock-skew',
        '--ignore-oversize',
        '--integrate',
        '--message-file',
        '--mimetype',
        '--no-prompt',
        '--no-verify',
        '--no-warnings',
        '--nosign',
        '--override-lock',
        '--private',
        '--tag',
        '--trace',
        '--user-override',
        '--verbose',
        '-M',
        '-m',
        '-n',
        '-v',
    ],
    'configuration': [
        '--repository',
        '-R',
    ],
    'dbstat': [
        '--brief',
        '--db-check',
        '--db-verify',
        '--omit-version-info',
        '-b',
    ],
    'deconstruct': [
        '--keep-private',
        '--keep-rid1',
        '--prefixlength',
        '--private',
        '--repository',
        '-K',
        '-L',
        '-P',
        '-R',
    ],
    'delete': [
        '--case-sensitive',
        '--dry-run',
        '--hard',
        '--reset',
        '--soft',
        '--verbose',
        '-n',
        '-v',
    ],
    'descendants': [
        '--repository',
        '--width',
        '-R',
        '-W',
    ],
    'describe': [
        '--digits',
        '--dirty',
        '--long',
        '--match',
        '-d',
    ],
    'detach': [],
    'diff': [
        '--binary',
        '--branch',
        '--brief',
        '--browser',
        '--by',
        '--by',
        '--checkin',
        '--command',
        '--context',
        '--diff-binary',
        '--exec-abs-paths',
        '--exec-rel-paths',
        '--from',
        '--ignore-all-space',
        '--ignore-trailing-space',
        '--internal',
        '--json',
        '--new-file',
        '--numstat',
        '--side-by-side',
        '--strip-trailing-cr',
        '--tcl',
        '--tclsh',
        '--tk',
        '--tk',
        '--to',
        '--undo',
        '--unified',
        '--verbose',
        '--versions',
        '--webpage',
        '--webpage',
        '--webpage',
        '--width',
        '-N',
        '-W',
        '-Z',
        '-b',
        '-b',
        '-c',
        '-ci',
        '-h',
        '-i',
        '-r',
        '-v',
        '-w',
        '-y',
        '-y',
    ],
    'export': [],
    'extras': [
        '--abs-paths',
        '--case-sensitive',
        '--dotfiles',
        '--header',
        '--ignore',
        '--rel-paths',
    ],
    'finfo': [
        '--brief',
        '--case-sensitive',
        '--id',
        '--limit',
        '--log',
        '--offset',
        '--print',
        '--revision',
        '--status',
        '--verbose',
        '--width',
        '-W',
        '-b',
        '-i',
        '-l',
        '-n',
        '-p',
        '-r',
        '-s',
        '-v',
    ],
    'fts-config': [],
    'fusefs': [],
    'git': [
        '--autopush',
        '--debug',
        '--force',
        '--if-mirrored',
        '--limit',
        '--mainbranch',
        '--quiet',
        '--quiet',
        '--verbose',
        '-f',
        '-q',
        '-q',
        '-v',
    ],
    'grep': [
        '--count',
        '--files-with-matches',
        '--ignore-case',
        '--invert-match',
        '--no-messages',
        '--once',
        '--verbose',
        '-c',
        '-i',
        '-l',
        '-s',
        '-v',
    ],
    'hash-policy': [],
    'help': [
        '--all',
        '--aux',
        '--commands',
        '--everything',
        '--full',
        '--html',
        '--options',
        '--setting',
        '--test',
        '--verbose',
        '--www',
        '-a',
        '-c',
        '-e',
        '-f',
        '-h',
        '-o',
        '-s',
        '-t',
        '-v',
        '-w',
        '-x',
    ],
    'hook': [
        '--aux-file',
        '--base-rcvid',
        '--dry-run',
        '--new-rcvid',
    ],
    'http': [
        '--acme',
        '--baseurl',
        '--cert',
        '--chroot',
        '--ckout-alias',
        '--extroot',
        '--files',
        '--host',
        '--https',
        '--in',
        '--ipaddr',
        '--jsmode',
        '--localauth',
        '--mainmenu',
        '--nocompress',
        '--nodelay',
        '--nojail',
        '--nossl',
        '--notfound',
        '--out',
        '--pkey',
        '--repolist',
        '--scgi',
        '--skin',
        '--th-trace',
        '--usepidkey',
    ],
    'import': [
        '--attribute',
        '--base',
        '--branches',
        '--export-marks',
        '--flat',
        '--force',
        '--git',
        '--ignore-tree',
        '--import-marks',
        '--incremental',
        '--no-rebuild',
        '--no-rev-tags',
        '--no-vacuum',
        '--quiet',
        '--rename-branch',
        '--rename-rev',
        '--rename-tag',
        '--rename-trunk',
        '--rev-tags',
        '--svn',
        '--tags',
        '--trunk',
        '--use-author',
        '-f',
        '-i',
        '-q',
    ],
    'info': [
        '--repository',
        '--verbose',
        '-R',
        '-v',
    ],
    'init': [
        '--admin-user',
        '--date-override',
        '--project-desc',
        '--project-name',
        '--sha1',
        '--template',
        '-A',
    ],
    'interwiki': [],
    'leaves': [
        '--all',
        '--bybranch',
        '--closed',
        '--multiple',
        '--recompute',
        '--width',
        '-W',
        '-a',
        '-c',
        '-m',
    ],
    'login-group': [],
    'ls': [
        '--age',
        '--hash',
        '--repository',
        '--verbose',
        '-R',
        '-r',
        '-t',
        '-v',
    ],
    'md5sum': [],
    'merge-base': [
        '--ignore-merges',
    ],
    'mv': [
        '--case-sensitive',
        '--dry-run',
        '--hard',
        '--soft',
        '-n',
    ],
    'open': [
        '--empty',
        '--force',
        '--force-missing',
        '--keep',
        '--nested',
        '--nosync',
        '--repodir',
        '--setmtime',
        '--sync',
        '--verbose',
        '--workdir',
        '-f',
        '-k',
    ],
    'patch': [
        '--dry-run',
        '--dry-run',
        '--force',
        '--force',
        '--force',
        '--force',
        '--fossilcmd',
        '--verbose',
        '--verbose',
        '--verbose',
        '-f',
        '-f',
        '-f',
        '-f',
        '-n',
        '-n',
        '-v',
        '-v',
        '-v',
    ],
    'pikchr': [
        '-div',
        '-div-center',
        '-div-indent',
        '-div-left',
        '-div-right',
        '-div-source',
        '-div-toggle',
        '-src',
        '-th',
        '-th-nosvg',
        '-th-novar',
        '-th-trace',
    ],
    'publish': [],
    'pull': [
        '--all',
        '--from-parent-project',
        '--httpauth',
        '--ipv4',
        '--no-http-compression',
        '--once',
        '--private',
        '--project-code',
        '--proxy',
        '--repository',
        '--ssh-command',
        '--ssl-identity',
        '--transport-command',
        '--verbose',
        '--verily',
        '-B',
        '-R',
        '-v',
    ],
    'purge': [
        '--dry-run',
        '--explain',
    ],
    'push': [
        '--all',
        '--httpauth',
        '--ipv4',
        '--no-http-compression',
        '--once',
        '--private',
        '--proxy',
        '--repository',
        '--ssh-command',
        '--ssl-identity',
        '--transport-command',
        '--verbose',
        '--verily',
        '-B',
        '-R',
        '-v',
    ],
    'rebuild': [
        '--analyze',
        '--cluster',
        '--compress',
        '--compress-only',
        '--deanalyze',
        '--force',
        '--ifneeded',
        '--index',
        '--noindex',
        '--noverify',
        '--pagesize',
        '--quiet',
        '--stats',
        '--vacuum',
        '--wal',
    ],
    'reconstruct': [
        '--keep-private',
        '--keep-rid1',
        '-K',
        '-P',
    ],
    'redo': [
        '--dry-run',
        '-n',
    ],
    'remote': [],
    'repack': [],
    'reparent': [
        '--date-override',
        '--dry-run',
        '--test',
        '--user-override',
        '-n',
    ],
    'revert': [
        '--revision',
        '-r',
    ],
    'rss': [
        '-limit',
        '-name',
        '-tag',
        '-tkt',
        '-type',
        '-url',
        '-wiki',
    'n',
    'y',
    ],
    'scrub': [
        '--force',
        '--private',
        '--verily',
    ],
    'search': [
        '--all',
        '--limit',
        '--width',
        '-W',
        '-a',
        '-n',
    ],
    'server': [
        '--acme',
        '--baseurl',
        '--cert',
        '--chroot',
        '--ckout-alias',
        '--create',
        '--errorlog',
        '--extroot',
        '--files',
        '--fossilcmd',
        '--https',
        '--jsmode',
        '--localauth',
        '--localhost',
        '--mainmenu',
        '--max-latency',
        '--nobrowser',
        '--nocompress',
        '--nojail',
        '--nossl',
        '--notfound',
        '--page',
        '--pkey',
        '--port',
        '--repolist',
        '--scgi',
        '--skin',
        '--th-trace',
        '--usepidkey',
        '-B',
        '-P',
        '-p',
    ],
    'settings': [
        '--exact',
        '--global',
        '--value',
    ],
    'sha1sum': [
        '--dereference',
        '-h',
    ],
    'sha3sum': [
        '--224',
        '--256',
        '--384',
        '--512',
        '--dereference',
        '--size',
        '-h',
    ],
    'shell': [],
    'sql': [
        '--no-repository',
        '--readonly',
        '--test',
        '-R',
    ],
    'sqlar': [
        '--exclude',
        '--include',
        '--list',
        '--name',
        '-R',
        '-X',
        '-l',
    ],
    'ssl-config': [],
    'stash': [],
    'sync': [
        '--all',
        '--httpauth',
        '--ipv4',
        '--no-http-compression',
        '--once',
        '--private',
        '--proxy',
        '--repository',
        '--ssh-command',
        '--ssl-identity',
        '--transport-command',
        '--unversioned',
        '--verbose',
        '--verily',
        '-B',
        '-R',
        '-u',
        '-v',
    ],
    'tag': [
        '--date-override',
        '--date-override',
        '--dry-run',
        '--dry-run',
        '--inverse',
        '--limit',
        '--prefix',
        '--propagate',
        '--raw',
        '--raw',
        '--raw',
        '--raw',
        '--tagtype',
        '--type',
        '--user-override',
        '--user-override',
        '-n',
        '-n',
        '-n',
        '-t',
        '-v',
    ],
    'tarball': [
        '--exclude',
        '--include',
        '--list',
        '--name',
        '-R',
        '-X',
        '-l',
    ],
    'ticket': [],
    'timeline': [
        '--branch',
        '--current-branch',
        '--format',
        '--full',
        '--limit',
        '--medium',
        '--offset',
        '--oneline',
        '--path',
        '--sql',
        '--type',
        '--verbose',
        '--width',
        '-F',
        '-R',
        '-W',
        '-b',
        '-c',
        '-n',
        '-p',
        '-t',
        '-v',
    ],
    'touch': [
        '--checkin',
        '--checkout',
        '--dry-run',
        '--now',
        '--quiet',
        '--verbose',
        '-C',
        '-G',
        '-c',
        '-g',
        '-n',
        '-q',
        '-v',
    ],
    'unpublished': [
        '--all',
    ],
    'unversioned': [
        '--dry-run',
        '--dry-run',
        '--glob',
        '--glob',
        '--like',
        '--like',
        '--mtime',
        '--repository',
        '--verbose',
        '--verbose',
        '-R',
        '-l',
        '-n',
        '-n',
        '-v',
        '-v',
    ],
    'update': [
        '--case-sensitive',
        '--debug',
        '--dry-run',
        '--force-missing',
        '--keep-merge-files',
        '--latest',
        '--nosync',
        '--setmtime',
        '--verbose',
        '--width',
        '-K',
        '-W',
        '-n',
        '-v',
    ],
    'user': [],
    'version': [],
    'whatis': [
        '--file',
        '--quiet',
        '--type',
        '--verbose',
        '-f',
        '-q',
        '-v',
    ],
    'wiki': [
        '--HTML',
        '--all',
        '--html',
        '--mimetype',
        '--pre',
        '--show-associated',
        '--show-technote-ids',
        '--technote',
        '--technote',
        '--technote',
        '--technote-bgcolor',
        '--technote-tags',
        '-H',
        '-M',
        '-a',
        '-h',
        '-p',
        '-s',
        '-t',
        '-t',
        '-t',
    ],
    'xdiff': [],
    'zip': [
        '--exclude',
        '--include',
        '--list',
        '--name',
        '-R',
        '-X',
        '-l',
    ],
}
FossilArgs['blame'] = FossilArgs['annotate']
FossilArgs['praise'] = FossilArgs['annotate']
FossilArgs['status'] = FossilArgs['changes']
FossilArgs['merge'] = FossilArgs['cherry-pick']
FossilArgs['forget'] = FossilArgs['delete']
FossilArgs['rm'] = FossilArgs['delete']
FossilArgs['gdiff'] = FossilArgs['diff']
FossilArgs['rename'] = FossilArgs['mv']
FossilArgs['undo'] = FossilArgs['redo']
FossilArgs['remote-url'] = FossilArgs['remote']
FossilArgs['ui'] = FossilArgs['server']
FossilArgs['unset'] = FossilArgs['settings']
FossilArgs['sqlite3'] = FossilArgs['sql']
FossilArgs['tls-config'] = FossilArgs['ssl-config']

var FossilCommonArgs = [
    '--args',
    '--case-sensitive',
    '--cgitrace',
    '--chdir',
    '--comfmtflags',
    '--comment-format',
    '--errorlog',
    '--help',
    '--httptrace',
    '--localtime',
    '--nocgi',
    '--no-th-hook',
    '--quiet',
    '--sqlstats',
    '--sqltrace',
    '--sshtrace',
    '--ssl-identity',
    '--systemtrace',
    '--user',
    '--utc',
    '--vfs',
    '-U',
]


# Check where a string is contained in g:fossil_short_cmds
def WantShortCommand(cmd: string): bool
    if !exists('g:fossil_short_cmds')
        return 0
    endif
    return index(g:fossil_short_cmds, cmd) != -1
enddef

# Build a fossil command
def BuildFossilCommand(arglist: list<string>): string
    var cmd = 'fossil'
    if exists('g:fossil_cmd')
        cmd = g:fossil_cmd
    endif
    # TODO: Changing directory helps if you are not inside a checked out
    # repository.  But doing it like this will mess with file name arguments.
    #var dir = expand('%')
    #if !empty(dir)
    #    dir = fnamemodify(dir, ':p:h')
    #    cmd = cmd .. ' --chdir ' .. shellescape(dir)
    #endif
    for arg in arglist
        cmd = cmd .. ' ' .. arg
    endfor
    return cmd
enddef

# Read fossil output into the current buffer
def ReadFossilOutput(line: number, ...args: list<string>)
    exec ':' .. line .. 'r!' .. BuildFossilCommand(args)
enddef

def ReRunCommand()
    if exists("b:fossil_cmdline")
        var view = winsaveview()
        :%d
        exec ':0r!' .. b:fossil_cmdline
        call winrestview(view)
    endif
enddef

# Function to run a fossil command in a buffer (use ! to just run command)
def CaptureFossilOutput(splitcmd: string, mods: string, bang: string,
                        ...args: list<string>)
    var fslcmd = BuildFossilCommand(args)
    if bang == '!'
        exec ':!' .. fslcmd
    else
        var cmd = splitcmd
        if cmd == 'default'
            if exists('g:fossil_split')
                cmd = g:fossil_split
            else
                cmd = 'split'
            endif
        endif
        if !empty(mods)
            if empty(cmd)
                cmd = 'split'
            endif
            cmd = mods .. ' ' .. cmd
        endif
        if !empty(cmd)
            silent exec ':' .. cmd
        endif
        enew
        b:fossil_cmd = len(args) > 0 ? args[0] : ''
        b:fossil_cmdline = fslcmd
        silent exec ':0r!' .. fslcmd
        silent :0
        setlocal buftype=nofile bufhidden=wipe nomodified noswapfile
        setlocal filetype=fossil
    endif
enddef

# Determine keys with a certain prefix
def ListCandidates(keys: list<string>, prefix: string): list<string>
    if empty(prefix)
        return keys
    endif
    var matches = []
    var n = len(prefix) - 1
    for key in keys
        if key[: n] == prefix
            matches += [key]
        endif
    endfor
    return uniq(matches)
enddef

def FossilComplete(A: string, L: string, P: number): list<string>
    var Fidx = stridx(L, 'F')               # First F is in e.g. :Fossil
    if Fidx == -1
        return []
    endif
    var Cidx = -1                           # Command index
    var Bidx = stridx(L[Fidx :], '!')       # Bang index
    var Sidx = stridx(L[Fidx :], ' ')       # Space index
    # Evaluate string before P and Cidx must stay less than P
    if Bidx != -1 && Fidx + Bidx < P && (Sidx == -1 || Bidx < Sidx)
        Cidx = Fidx + Bidx + 1
    elseif (Sidx != -1 && Fidx + Sidx < P)
        Cidx = Fidx + Sidx
    else
        return []
    endif
    while Cidx < P && L[Cidx] == ' '
        ++Cidx
    endwhile
    if Cidx == P
        # Cursor is immediately after ! or spaces after the :Fossil command
        return sort(keys(FossilArgs))
    endif
    var cmd = L[Cidx : P - 1]
    Sidx = stridx(cmd, ' ')
    if Sidx == -1
        var cmds = ListCandidates(keys(FossilArgs), cmd)
        if len(cmds) == 1
            # Add a space if we are expanding a single candidate
            return [cmds[0] .. ' ']
        endif
        return sort(cmds)
    endif
    cmd = cmd[: Sidx - 1]
    if !has_key(FossilArgs, cmd)
        var cmds = ListCandidates(keys(FossilArgs), cmd)
        if len(cmds) != 1
            cmd = ''
        else
            cmd = cmds[0]
        endif
    endif
    if A[: 0] == '-'
        if empty(cmd)
            return []
        endif
        return ListCandidates(FossilArgs[cmd] + FossilCommonArgs, A)
    endif
    return glob(A .. '*', 0, 1, 1)
enddef

def CreateFossilCommand(splitcmd: string, cmd: string, fslcmd: string)
    var compfun = 'file'
    if empty(fslcmd)
        compfun = 'customlist,FossilComplete'
    elseif has_key(FossilArgs, fslcmd)
        compfun = 'customlist,FossilCompleteF' .. fslcmd
    endif
    var vimcmd = ':command! -bang -bar -nargs=* -complete=' .. compfun .. ' ' .. cmd
    vimcmd = vimcmd .. ' call CaptureFossilOutput("' .. splitcmd .. '"'
    vimcmd = vimcmd .. ', <q-mods>, <q-bang>'
    if !empty(fslcmd)
        vimcmd = vimcmd .. ', "' .. fslcmd .. '"'
    endif
    vimcmd = vimcmd .. ', <f-args>)'
    exec vimcmd
enddef

def SetupFossilCommands(fslcmd: string = '')
    # Create a completion function for use in CreateFossilCommand()
    if !empty(fslcmd)
        var fc = 'FossilCompleteF' .. fslcmd
        var fa = 'FossilArgs["' .. fslcmd .. '"] + FossilCommonArgs'
        var commcmd = [
            ':def ' .. fc .. '(A: string, L: string, P: number): list<string>',
            '    if has_key(FossilArgs, "' .. fslcmd .. '") && A[: 0] == "-"',
            '        return ListCandidates(' .. fa .. ', A)',
            '    endif',
            '    return glob(A .. "*", 0, 1, 1)',
            'enddef',
        ]
        exec join(commcmd, "\n")
    endif
    # Now build the commands
    var splitcmds = { '': 'default', 'C': '', 'S': 'split', 'V': 'vsplit' }
    for [prefix, splitcmd] in items(splitcmds)
        var cmd = prefix .. 'F' .. fslcmd
        if empty(fslcmd)
            if WantShortCommand(prefix .. 'F')
                CreateFossilCommand(splitcmd, prefix .. 'F', '')
            endif
            cmd = prefix .. 'Fossil'
        endif
        CreateFossilCommand(splitcmd, cmd, fslcmd)
    endfor
enddef

#
# Commands
#

SetupFossilCommands()

if exists('g:fossil_sub_cmds')
    for fslcmd in g:fossil_sub_cmds
        SetupFossilCommands(fslcmd)
    endfor
endif

command! -bar -nargs=* -range -complete=file RFossil {
    # NOTE: Annoyingly, vim will use line 1 with ':0RFossil status'
    call ReadFossilOutput(<line2>, <f-args>)
}

if WantShortCommand('RF')
    command! -bar -nargs=* -range -complete=file RF {
        call ReadFossilOutput(<line2>, <f-args>)
    }
endif

command -bar FRefresh call ReRunCommand()
if WantShortCommand('FR')
    command -bar FR call ReRunCommand()
endif
