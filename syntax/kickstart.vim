" Vim syntax file
" Language: RedHat kickstart installation description files
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2010-02-10

" Setup {{{
" React to possibly already-defined syntax.
" For version 5.x: Clear all syntax items unconditionally
" For version 6.x: Quit when a syntax file was already loaded
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

syn case match
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Comments {{{
syn match kickstartComment "^\s*#.*$" contains=kickstartTodo
syn keyword kickstartTodo TODO FIXME NOT XXX contained
syn match kickstartString "\".*\""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Base constructs and sectioning {{{
syn match kickstartEquals "=" contained
syn match kickstartInclude "^\s*%include\s\+.*"
syn region kickstartPackages matchgroup=kickstartInclude start="^\s*%packages\>" end="\(^\s*%\)\@=\|\%$" contains=kickstartPackageGroup,kickstartComment,kickstartPackageOption2
syntax include @Sh syntax/sh.vim
syn region kickstartPrePost matchgroup=kickstartInclude start="^\s*%\(pre\|post\)\>" end="\(^\s*%\)\@=\|\%$" contains=kickstartComment,kickstartPrePostOption2,@Sh
syn match kickstartPackageGroup "^@ .*"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Options {{{
"
syn match kickstartOptionBOL "^\s*\zs\w\+\>" contains=kickstartOption,kickstartInstallMethod
syn match kickstartBool "\<\(yes\|no\)\>"
syn match kickstartPassword "$[0-9]$\S*"
syn match kickstartNumber "=\=\<[0-9]*\>" contains=kickstartEquals
syn match kickstartPassword "grub.pbkdf2.\S*"
syn keyword kickstartOption autostep auth[config] bootloader contained
syn keyword kickstartOption clearpart device[probe] driverdisk contained
syn keyword kickstartOption firewall firstboot install interactive keyboard contained
syn keyword kickstartOption lang[support] lilo[check] logvol contained
syn keyword kickstartOption mouse network part[ition] raid contained
syn keyword kickstartOption reboot rootpw skipx text timezone contained
syn keyword kickstartOption upgrade xconfig volgroup zerombr contained
syn keyword kickstartOption sshpw user selinux reqpart services eula repo contained
syn keyword kickstartInstallMethod cdrom harddrive nfs url contained
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Options of options :-) {{{
" auth or authconfig
syn match kickstartOption2 "\s\zs--\(enablemd5\|enablenis\|useshadow\|enableshadow\|enableldap\|enableldapauth\|enableldaptls\|enablekrb5\|enablehesiod\|hesiodlhs\|hesiodrhs\|enablesmbauth\|enablecache\)\>"
syn match kickstartOption2 "\s\zs--\(nisdomain\|nisserver\|ldapserver\|ldapbasedn\|krb5realm\|krb5adminserver\|krb5kdc\|smbservers\|smbworkgroup\|passalgo\)\>=\=" contains=kickstartEquals
" bootloader and lilo
syn match kickstartOption2 "\s\zs--\(uselilo\|linear\|nolinear\|lba32\|upgrade\)\>"
syn match kickstartOption2 "\s\zs--\(append\|location\|password\|md5pass\|timeout\|driveorder\)\>=\=" contains=kickstartEquals
" clearpart
syn match kickstartOption2 "\s\zs--\(all\|linux\|initlabel\)\>"
syn match kickstartOption2 "\s\zs--\(drives\)\>=\=" contains=kickstartEquals
" device
syn keyword kickstartModuleType scsi eth
syn match kickstartOption2 "\s\zs--\(opts\)\>=\=" contains=kickstartEquals
" driverdisk
syn match kickstartOption2 "\s\zs--\(type\)\>=\=" contains=kickstartEquals
" firewall
syn match kickstartOption2 "\s\zs--\(high\|medium\|disabled\|dhcp\|ssh\|telnet\|smtp\|http\|ftp\)\>"
syn match kickstartOption2 "\s\zs--\(trust\|port\)\>=\=" contains=kickstartEquals
" firstboot
syn match kickstartOption2 "\s\zs--\(enable\|enabled\|disable\|disabled\|reconfig\)\>"
" install
syn match kickstartOption2 "\s\zs--\(partition\|server\|dir\)\>=\=" contains=kickstartEquals
" keyboard
syn match kickstartOption2 "\s\zs--\(vckeymap\)\>=\=" contains=kickstartEquals
syn match kickstartKeyboard "\<\(be-latin1\|bg\|br-abnt2\|cf\|cz-lat2\)\>"
syn match kickstartKeyboard "\<\(cz-us-qwertz\|de\|de-latin1\)\>"
syn match kickstartKeyboard "\<\(de-latin1-nodeadkeys\|dk\|dk-latin1\)\>"
syn match kickstartKeyboard "\<\(dvorak\|es\|et\|fi\|fi-latin1\|fr\)\>"
syn match kickstartKeyboard "\<\(fr-latin0\|fr-latin1\|fr-pc\|fr_CH\)\>"
syn match kickstartKeyboard "\<\(fr_CH-latin1\|gr\|hu\|hu101\|is-latin1\)\>"
syn match kickstartKeyboard "\<\(it\|it-ibm\|it2\|jp106\|la-latin1\)\>"
syn match kickstartKeyboard "\<\(mk-utf\|no\|no-latin1\|pl\|pt-latin1\)\>"
syn match kickstartKeyboard "\<\(ro_win\|ru\|ru-cp1251\|ru-ms\|ru1\|ru2\)\>"
syn match kickstartKeyboard "\<\(ru_win\|se-latin1\|sg\|sg-latin1\)\>"
syn match kickstartKeyboard "\<\(sk-qwerty\|slovene\|speakup\)\>"
syn match kickstartKeyboard "\<\(speakup-lt\|sv-latin1\|sg\|sg-latin1\)\>"
syn match kickstartKeyboard "\<\(sk-querty\|slovene\|trq\|ua\|uk\|us\)\>"
syn match kickstartKeyboard "\<\(us-acentos\)\>"
syn match kickstartKeyboard "\<\(gb-extd\)\>"
" timezone
syn match kickstartTimezone "\<\([A-Z][a-z]*/[A-Z][a-z]*\)\>"
" language
syn match kickstartLang "\<[a-z][a-z]_[A-Z][A-Z]\>"
" langsupport
syn match kickstartOption2 "\s\zs--\(default\|addsupport\)\>=\=" contains=kickstartEquals
" logvol
syn match kickstartOption2 "\s\zs--\(vgname\|size\|name\)\>=\=" contains=kickstartEquals
" mouse
syn match kickstartOption2 "\s\zs--\(device\)\>"
syn match kickstartOption2 "\s\zs--\(emulthree\)\>=\=" contains=kickstartEquals
" network
syn match kickstartOption2 "\s\zs--\(nodns\|activate\|nodefroute\|nodns\|noipv4\|noipv6\)\>"
syn match kickstartOption2 "\s\zs--\(bootproto\|device\|onboot\|ip\|ipv6\|gateway\|ipv6gateway\|nameserver\|netmask\|hostname\|ethtool\|essid\|wepkey\|wpakey\|dhcpclass\|mtu\|bondslaves\|bondopts\|vlanid\|interfacename\|teamslaves\|teamconfig\|bridgeslaves\|bridgeopts\|url\)\>=\=" contains=kickstartEquals
" partition
syn match kickstartOption2 "\s\zs--\(recommended\|grow\|noformat\|asprimary\|badblocks\)\>"
syn match kickstartOption2 "\s\zs--\(size\|maxsize\|onpart\|usepart\|ondisk\|ondrive\|bytes-per-inode\|fstype\|start\|end\|label\)\>=\=" contains=kickstartEquals
" raid
syn match kickstartOption2 "\s\zs--\(level\|device\|spares\|fstype\|noformat\)\>=\=" contains=kickstartEquals
" rootpw
syn match kickstartOption2 "\s\zs--\(iscrypted\)\>"
" timezone
syn match kickstartOption2 "\s\zs--\(utc\)\>"
syn match kickstartOption2 "\s\zs--\(ntpservers\)\>=\=" contains=kickstartEquals
" xconfig
syn match kickstartOption2 "\s\zs--\(noprobe\|startxonboot\)\>"
syn match kickstartOption2 "\s\zs--\(card\|videoram\|monitor\|hsync\|vsync\|defaultdesktop\|resolution\|depth\)\>=\=" contains=kickstartEquals
" packages
syn match kickstartPackageOption2 "\s\zs--\(default\|resolvedeps\|excludedocs\|ignoredeps\|ignoremissing\|multilib\|nocore\)\>"
" pre and post
syn match kickstartPrePostOption2 "\s\zs--\(interpreter\|nochroot\)\>"
" sshpw
syn match kickstartOption2 "\s\zs--\(user\)\>=\=" contains=kickstartEquals
" user
syn match kickstartOption2 "\s\zs--\(lock\|iscrypted\|plaintext\)\>"
syn match kickstartOption2 "\s\zs--\(name\|username\|gecos\|groups\|homedir\|password\|shell\|uid\|gid\)\>=\=" contains=kickstartEquals
" services
syn match kickstartOption2 "\s\zs--\(enabled\|disable\|disabledd\)\>=\=" contains=kickstartEquals
" repo
syn match kickstartOption2 "\s\zs--\(baseurl\)\>=\=" contains=kickstartEquals
" eula
syn match kickstartPrePostOption2 "\s\zs--\(agreed\)\>"
" reqpart
syn match kickstartPrePostOption2 "\s\zs--\(add-boot\)\>"
" selinux
syn match kickstartPrePostOption2 "\s\zs--\(permissive\|disabled\|enforcing\)\>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_kickstart_syntax_inits")
  if version < 508
    let did_kickstart_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kickstartComment           Comment
  HiLink kickstartTodo              Todo
  HiLink kickstartInclude           Preproc
  HiLink kickstartInstallMethod     Type
  HiLink kickstartOption            Keyword
  HiLink kickstartEquals            kickstartOption2
  HiLink kickstartPackageOption2    kickstartOption2
  HiLink kickstartPrePostOption2    kickstartOption2
  HiLink kickstartOption2           Identifier
  HiLink kickstartModuleType        kickstartEnum
  HiLink kickstartKeyboard          kickstartEnum
  HiLink kickstartTimezone          kickstartEnum
  HiLink kickstartPackageGroup      Special
  HiLink kickstartEnum              Constant
  HiLink kickstartBool				Boolean
  HiLink kickstartLang				Constant
  HiLink kickstartNumber			Number
  HiLink kickstartString			String
  HiLink kickstartPassword			String
  delcommand HiLink
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
let b:current_syntax = "kickstart"

