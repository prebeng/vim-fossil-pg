" Vim syntax file
" Language:	Fossil information (commit, status, timeline)
" Maintainer:	Preben Guldberg <preben@guldberg.org>
" Filenames:	N/A
" Last Change:	2023 Oct 12
" License:      MIT

if exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=100

" Comments can contain evrything below as well as a diff
syn match  fossilComment      "^#.*" contains=TOP
syn include @fossilDiff syntax/diff.vim
syn region fossilDiff start="^\%(#\{78\}\|=\{66\}\)$" end="^$\|\%$" contains=@fossilDiff fold

" General for status and commits
" Order matters: e.g. fossilTags overrules fossilStatusKey
syn match  fossilStatusKey      "^[-a-zA-Z0-9]\+:"
syn match  fossilUser           "\<user: *[-_@.a-zA-z0-9]\+"
syn match  fossilTags           "\<tags:\%( *[-_@.a-zA-z0-9]\+\%(,\)\=\)*"
syn match  fossilTagTrunk       "\<trunk\>" contained containedin=fossilTags
syn match  fossilPrivate        "^# PRIVATE BRANCH:" contained containedin=fossilComment
syn match  fossilDryRun         "\%(# \)\=\zsDRY-RUN:" contained containedin=fossilComment
syn match  fossilDate           "\<\d\d\d\d-\d\d-\d\d\>\%( \d\d:\d\d:\d\d\%( UTC\| [-+]\d\d:\d\d\)\=\)\="

" Dates and hashes in timeline
syn match  fossilHash           "\[\=\x\{10,\}\]\="
syn match  fossilDate           "^=== \d\d\d\d-\d\d-\d\d ===$"
syn match  fossilDate           "^\d\d:\d\d:\d\d \[\x\+\]" contains=fossilHash

" Options in Fossil help output
syn match  fossilHelpOption     "^\s\+\%(-\a\+\(|--\S\+\)\= \%( \|\S\+\)\=\)"
syn match  fossilHelpOption     "^\s\+\%(--\S\+ \%( \|\S\+\)\=\)"
syn match  fossilHelpOptionArg  " -\@!\S\+" contained containedin=fossilHelpOption
syn match  fossilHelpParam      "^\s\+\a\%(\w\|-\)*\%(=\S\+\)\=\%(  \|$\)"
syn match  fossilHelpParamArg   "=\zs\S\+" contained containedin=fossilHelpParam
syn match  fossilHelpNone       "=" contained containedin=fossilHelpParamArg

" Fossil praise output, also works for annotate and blame
syn match  fossilPraise         "^\x\+ \d\d\d\d-\d\d-\d\d \+[-_@.a-zA-Z0-9]\+" contains=fossilHash,fossilDate

" File status information in alphabetical order (status, commit and others)
syn match  fossilAdded          "\%(^\|# \)\s*\zsADDED \+\f\+\|\<ADDED\>"
syn match  fossilAdded          "\%(^\|# \)\s*\zsADDED_BY_INTEGRATE \+\f\+\|\<ADDED_BY_INTEGRATE\>"
syn match  fossilAdded          "\%(^\|# \)\s*\zsADDED_BY_MERGE \+\f\+\|\<ADDED_BY_MERGE\>"
syn match  fossilConflict       "\%(^\|# \)\s*\zsCONFLICT \+\f\+\|\<CONFLICT\>"
syn match  fossilDeleted        "\%(^\|# \)\s*\zsDELETED \+\f\+\|\<DELETED\>"
syn match  fossilEdited         "\%(^\|# \)\s*\zsEDITED \+\f\+\|\<EDITED\>"
syn match  fossilExecutable     "\%(^\|# \)\s*\zsEXECUTABLE \+\f\+\|\<EXECUTABLE\>"
syn match  fossilExtra          "\%(^\|# \)\s*\zsEXTRA \+\f\+\|\<EXTRA\>"
syn match  fossilMissing        "\%(^\|# \)\s*\zsMISSING \+\f\+\|\<MISSING\>"
syn match  fossilNotAFile       "\%(^\|# \)\s*\zsNOT_A_FILE \+\f\+\|\<NOT_A_FILE\>"
syn match  fossilRenamed        "\%(^\|# \)\s*\zsRENAMED \+\f\+\|\<RENAMED\>"
syn match  fossilSymlink        "\%(^\|# \)\s*\zsSYMLINK \+\f\+\|\<SYMLINK\>"
syn match  fossilUnchanged      "\%(^\|# \)\s*\zsUNCHANGED \+\f\+\|\<UNCHANGED\>"
syn match  fossilUnexec         "\%(^\|# \)\s*\zsUNEXEC \+\f\+\|\<UNEXEC\>"
syn match  fossilUnlink         "\%(^\|# \)\s*\zsUNLINK \+\f\+\|\<UNLINK\>"
syn match  fossilUpdated        "\%(^\|# \)\s*\zsUPDATED \+\f\+\|\<UPDATED\>"
syn match  fossilUpdated        "\%(^\|# \)\s*\zsUPDATED_BY_INTEGRATE \+\f\+\|\<UPDATED_BY_INTEGRATE\>"
syn match  fossilUpdated        "\%(^\|# \)\s*\zsUPDATED_BY_MERGE \+\f\+\|\<UPDATED_BY_MERGE\>"

" Common defs used below
hi def link fossilError         Error
hi def link fossilWarning       Todo
hi def link fossilAddRm         Constant
hi def link fossilUnusual       Statement

" Misc.
hi def link fossilComment       Comment
hi def link fossilStatusKey     Comment
hi def link fossilUser          Statement
hi def link fossilTags          Type
hi def link fossilTagTrunk      fossilWarning
hi def link fossilDryRun        Todo
hi def link fossilPrivate       Todo
hi def link fossilDate          Constant
hi def link fossilHash          Comment
hi def link fossilHelpOption    Statement
hi def link fossilHelpOptionArg Constant
hi def link fossilHelpParam     fossilHelpOption
hi def link fossilHelpParamArg  fossilHelpOptionArg
hi def link fossilPraise        fossilUser

" File status information
hi def link fossilAdded         fossilAddRm
hi def link fossilConflict      Error
hi def link fossilDeleted       fossilAddRm
hi def link fossilEdited        Comment
hi def link fossilExecutable    fossilUnusual
hi def link fossilExtra         fossilUnusual
hi def link fossilMissing       Error
hi def link fossilNotAFile      fossilUnusual
hi def link fossilRenamed       fossilAddRm
hi def link fossilSymlink       fossilUnusual
hi def link fossilUnchanged     Normal
hi def link fossilUnexec        fossilUnusual
hi def link fossilUnlink        fossilUnusual
hi def link fossilUpdated       Type
