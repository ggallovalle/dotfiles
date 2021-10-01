# ----------------- XDG standard ------------------
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache
set -x DOTFILES $HOME/.dotfiles
# ----------------- default apps ------------------
set -x TERM xterm # use the following because tmux messes up vim colors
# set -x TERM screen-256color-bce
set -x EDITOR nvim
set -x VISUAL nvim
set -x TERMINAL alacritty
set -x BROWSER firefox-developer-edition
# set -x BROWSER vivaldi-stable
# install vivid for a new color scheme
# https://github.com/sharkdp/vivid
# malokai (goes best with alacritty one_doom)
set -x LS_COLORS "ln=0;38;2;249;38;114:cd=0;38;2;249;38;114;48;2;51;51;51:st=0:pi=0;38;2;0;0;0;48;2;102;217;239:no=0:di=0;38;2;102;217;239:ow=0:or=0;38;2;0;0;0;48;2;255;74;68:bd=0;38;2;102;217;239;48;2;51;51;51:mi=0;38;2;0;0;0;48;2;255;74;68:fi=0:ex=1;38;2;249;38;114:*~=0;38;2;122;112;112:tw=0:so=0;38;2;0;0;0;48;2;249;38;114:*.d=0;38;2;0;255;135:*.z=4;38;2;249;38;114:*.c=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.r=0;38;2;0;255;135:*.o=0;38;2;122;112;112:*.h=0;38;2;0;255;135:*.p=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.a=1;38;2;249;38;114:*.pl=0;38;2;0;255;135:*.bz=4;38;2;249;38;114:*.xz=4;38;2;249;38;114:*.gv=0;38;2;0;255;135:*.ui=0;38;2;166;226;46:*.so=1;38;2;249;38;114:*.ex=0;38;2;0;255;135:*.cr=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.rm=0;38;2;253;151;31:*.hs=0;38;2;0;255;135:*.ll=0;38;2;0;255;135:*.pp=0;38;2;0;255;135:*.la=0;38;2;122;112;112:*.as=0;38;2;0;255;135:*.ps=0;38;2;230;219;116:*.td=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.vb=0;38;2;0;255;135:*.ml=0;38;2;0;255;135:*.hh=0;38;2;0;255;135:*.mn=0;38;2;0;255;135:*.cc=0;38;2;0;255;135:*.ts=0;38;2;0;255;135:*.rs=0;38;2;0;255;135:*.rb=0;38;2;0;255;135:*.pm=0;38;2;0;255;135:*.7z=4;38;2;249;38;114:*.py=0;38;2;0;255;135:*.kt=0;38;2;0;255;135:*.jl=0;38;2;0;255;135:*.di=0;38;2;0;255;135:*.el=0;38;2;0;255;135:*.sh=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.md=0;38;2;226;209;57:*.fs=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*css=0;38;2;0;255;135:*.lo=0;38;2;122;112;112:*.bc=0;38;2;122;112;112:*.hi=0;38;2;122;112;112:*.js=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.gz=4;38;2;249;38;114:*.cxx=0;38;2;0;255;135:*.exe=1;38;2;249;38;114:*.fsx=0;38;2;0;255;135:*.odt=0;38;2;230;219;116:*.zsh=0;38;2;0;255;135:*.xlr=0;38;2;230;219;116:*.mp4=0;38;2;253;151;31:*.epp=0;38;2;0;255;135:*.bib=0;38;2;166;226;46:*.h++=0;38;2;0;255;135:*.jpg=0;38;2;253;151;31:*.tcl=0;38;2;0;255;135:*.flv=0;38;2;253;151;31:*.apk=4;38;2;249;38;114:*.mid=0;38;2;253;151;31:*.com=1;38;2;249;38;114:*.out=0;38;2;122;112;112:*.elm=0;38;2;0;255;135:*.ics=0;38;2;230;219;116:*.odp=0;38;2;230;219;116:*.pps=0;38;2;230;219;116:*.mp3=0;38;2;253;151;31:*.ilg=0;38;2;122;112;112:*.ico=0;38;2;253;151;31:*.xmp=0;38;2;166;226;46:*.vcd=4;38;2;249;38;114:*.def=0;38;2;0;255;135:*.ps1=0;38;2;0;255;135:*.sql=0;38;2;0;255;135:*.swp=0;38;2;122;112;112:*.yml=0;38;2;166;226;46:*.dpr=0;38;2;0;255;135:*.sty=0;38;2;122;112;112:*.vob=0;38;2;253;151;31:*.asa=0;38;2;0;255;135:*.otf=0;38;2;253;151;31:*.tgz=4;38;2;249;38;114:*.toc=0;38;2;122;112;112:*.zip=4;38;2;249;38;114:*.fon=0;38;2;253;151;31:*.avi=0;38;2;253;151;31:*.git=0;38;2;122;112;112:*.dmg=4;38;2;249;38;114:*.mkv=0;38;2;253;151;31:*.php=0;38;2;0;255;135:*.m4a=0;38;2;253;151;31:*.tbz=4;38;2;249;38;114:*.bag=4;38;2;249;38;114:*.ind=0;38;2;122;112;112:*.bst=0;38;2;166;226;46:*.ltx=0;38;2;0;255;135:*.jar=4;38;2;249;38;114:*.pdf=0;38;2;230;219;116:*.png=0;38;2;253;151;31:*.pro=0;38;2;166;226;46:*.bcf=0;38;2;122;112;112:*.erl=0;38;2;0;255;135:*.pas=0;38;2;0;255;135:*.inl=0;38;2;0;255;135:*.awk=0;38;2;0;255;135:*hgrc=0;38;2;166;226;46:*.ppt=0;38;2;230;219;116:*.fls=0;38;2;122;112;112:*.log=0;38;2;122;112;112:*.lua=0;38;2;0;255;135:*.bz2=4;38;2;249;38;114:*.ogg=0;38;2;253;151;31:*.xml=0;38;2;226;209;57:*.tml=0;38;2;166;226;46:*.wmv=0;38;2;253;151;31:*.bak=0;38;2;122;112;112:*.cpp=0;38;2;0;255;135:*.sxw=0;38;2;230;219;116:*.rpm=4;38;2;249;38;114:*.mir=0;38;2;0;255;135:*.aux=0;38;2;122;112;112:*.eps=0;38;2;253;151;31:*.sxi=0;38;2;230;219;116:*.fsi=0;38;2;0;255;135:*.ini=0;38;2;166;226;46:*.rtf=0;38;2;230;219;116:*.rst=0;38;2;226;209;57:*.swf=0;38;2;253;151;31:*.sbt=0;38;2;0;255;135:*.kts=0;38;2;0;255;135:*.wma=0;38;2;253;151;31:*.bsh=0;38;2;0;255;135:*.pgm=0;38;2;253;151;31:*.vim=0;38;2;0;255;135:*TODO=1:*.ods=0;38;2;230;219;116:*.kex=0;38;2;230;219;116:*.cfg=0;38;2;166;226;46:*.rar=4;38;2;249;38;114:*.mpg=0;38;2;253;151;31:*.gif=0;38;2;253;151;31:*.tsx=0;38;2;0;255;135:*.deb=4;38;2;249;38;114:*.exs=0;38;2;0;255;135:*.dot=0;38;2;0;255;135:*.htc=0;38;2;0;255;135:*.clj=0;38;2;0;255;135:*.bbl=0;38;2;122;112;112:*.arj=4;38;2;249;38;114:*.nix=0;38;2;166;226;46:*.pkg=4;38;2;249;38;114:*.txt=0;38;2;226;209;57:*.ttf=0;38;2;253;151;31:*.fnt=0;38;2;253;151;31:*.hxx=0;38;2;0;255;135:*.mov=0;38;2;253;151;31:*.htm=0;38;2;226;209;57:*.pyc=0;38;2;122;112;112:*.aif=0;38;2;253;151;31:*.img=4;38;2;249;38;114:*.pbm=0;38;2;253;151;31:*.dll=1;38;2;249;38;114:*.ppm=0;38;2;253;151;31:*.bat=1;38;2;249;38;114:*.ipp=0;38;2;0;255;135:*.dox=0;38;2;166;226;46:*.xcf=0;38;2;253;151;31:*.doc=0;38;2;230;219;116:*.bin=4;38;2;249;38;114:*.pod=0;38;2;0;255;135:*.psd=0;38;2;253;151;31:*.blg=0;38;2;122;112;112:*.tex=0;38;2;0;255;135:*.hpp=0;38;2;0;255;135:*.wav=0;38;2;253;151;31:*.idx=0;38;2;122;112;112:*.csv=0;38;2;226;209;57:*.tar=4;38;2;249;38;114:*.xls=0;38;2;230;219;116:*.bmp=0;38;2;253;151;31:*.iso=4;38;2;249;38;114:*.c++=0;38;2;0;255;135:*.mli=0;38;2;0;255;135:*.inc=0;38;2;0;255;135:*.svg=0;38;2;253;151;31:*.pid=0;38;2;122;112;112:*.tif=0;38;2;253;151;31:*.cgi=0;38;2;0;255;135:*.m4v=0;38;2;253;151;31:*.gvy=0;38;2;0;255;135:*.csx=0;38;2;0;255;135:*.tmp=0;38;2;122;112;112:*.h264=0;38;2;253;151;31:*.conf=0;38;2;166;226;46:*.purs=0;38;2;0;255;135:*.orig=0;38;2;122;112;112:*.tiff=0;38;2;253;151;31:*.java=0;38;2;0;255;135:*.docx=0;38;2;230;219;116:*.fish=0;38;2;0;255;135:*.make=0;38;2;166;226;46:*.json=0;38;2;166;226;46:*.hgrc=0;38;2;166;226;46:*.yaml=0;38;2;166;226;46:*.xlsx=0;38;2;230;219;116:*.epub=0;38;2;230;219;116:*.mpeg=0;38;2;253;151;31:*.pptx=0;38;2;230;219;116:*.bash=0;38;2;0;255;135:*.html=0;38;2;226;209;57:*.diff=0;38;2;0;255;135:*.rlib=0;38;2;122;112;112:*.psd1=0;38;2;0;255;135:*.flac=0;38;2;253;151;31:*.less=0;38;2;0;255;135:*.lisp=0;38;2;0;255;135:*.lock=0;38;2;122;112;112:*.dart=0;38;2;0;255;135:*.jpeg=0;38;2;253;151;31:*.tbz2=4;38;2;249;38;114:*.toml=0;38;2;166;226;46:*.psm1=0;38;2;0;255;135:*.dyn_o=0;38;2;122;112;112:*.toast=4;38;2;249;38;114:*.patch=0;38;2;0;255;135:*.cmake=0;38;2;166;226;46:*passwd=0;38;2;166;226;46:*.swift=0;38;2;0;255;135:*README=0;38;2;0;0;0;48;2;230;219;116:*.mdown=0;38;2;226;209;57:*.shtml=0;38;2;226;209;57:*.ipynb=0;38;2;0;255;135:*.xhtml=0;38;2;226;209;57:*.cabal=0;38;2;0;255;135:*.scala=0;38;2;0;255;135:*shadow=0;38;2;166;226;46:*.class=0;38;2;122;112;112:*.cache=0;38;2;122;112;112:*.matlab=0;38;2;0;255;135:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*.dyn_hi=0;38;2;122;112;112:*COPYING=0;38;2;182;182;182:*.flake8=0;38;2;166;226;46:*.ignore=0;38;2;166;226;46:*.groovy=0;38;2;0;255;135:*.config=0;38;2;166;226;46:*.gradle=0;38;2;0;255;135:*LICENSE=0;38;2;182;182;182:*TODO.md=1:*TODO.txt=1:*.gemspec=0;38;2;166;226;46:*.desktop=0;38;2;166;226;46:*setup.py=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*Doxyfile=0;38;2;166;226;46:*.DS_Store=0;38;2;122;112;112:*.rgignore=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*.cmake.in=0;38;2;166;226;46:*README.md=0;38;2;0;0;0;48;2;230;219;116:*.kdevelop=0;38;2;166;226;46:*.markdown=0;38;2;226;209;57:*configure=0;38;2;166;226;46:*.fdignore=0;38;2;166;226;46:*SConstruct=0;38;2;166;226;46:*.localized=0;38;2;122;112;112:*.gitconfig=0;38;2;166;226;46:*SConscript=0;38;2;166;226;46:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*CODEOWNERS=0;38;2;166;226;46:*Dockerfile=0;38;2;166;226;46:*.scons_opt=0;38;2;122;112;112:*.gitignore=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*LICENSE-MIT=0;38;2;182;182;182:*.synctex.gz=0;38;2;122;112;112:*Makefile.in=0;38;2;122;112;112:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*.travis.yml=0;38;2;230;219;116:*.gitmodules=0;38;2;166;226;46:*Makefile.am=0;38;2;166;226;46:*MANIFEST.in=0;38;2;166;226;46:*.applescript=0;38;2;0;255;135:*configure.ac=0;38;2;166;226;46:*.fdb_latexmk=0;38;2;122;112;112:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*appveyor.yml=0;38;2;230;219;116:*.clang-format=0;38;2;166;226;46:*.gitattributes=0;38;2;166;226;46:*CMakeLists.txt=0;38;2;166;226;46:*CMakeCache.txt=0;38;2;122;112;112:*LICENSE-APACHE=0;38;2;182;182;182:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*.sconsign.dblite=0;38;2;122;112;112:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"
# snazzy (goes best with alacritty snazzy)
# set -x LS_COLORS "fi=0:ex=1;38;2;255;92;87:ln=0;38;2;255;106;193:st=0:ow=0:pi=0;38;2;0;0;0;48;2;87;199;255:bd=0;38;2;154;237;254;48;2;51;51;51:cd=0;38;2;255;106;193;48;2;51;51;51:di=0;38;2;87;199;255:mi=0;38;2;0;0;0;48;2;255;92;87:*~=0;38;2;102;102;102:so=0;38;2;0;0;0;48;2;255;106;193:or=0;38;2;0;0;0;48;2;255;92;87:no=0:tw=0:*.c=0;38;2;90;247;142:*.a=1;38;2;255;92;87:*.r=0;38;2;90;247;142:*.p=0;38;2;90;247;142:*.d=0;38;2;90;247;142:*.o=0;38;2;102;102;102:*.m=0;38;2;90;247;142:*.t=0;38;2;90;247;142:*.h=0;38;2;90;247;142:*.z=4;38;2;154;237;254:*.ts=0;38;2;90;247;142:*.lo=0;38;2;102;102;102:*.go=0;38;2;90;247;142:*.ko=1;38;2;255;92;87:*.js=0;38;2;90;247;142:*.pp=0;38;2;90;247;142:*.as=0;38;2;90;247;142:*.rm=0;38;2;255;180;223:*.la=0;38;2;102;102;102:*css=0;38;2;90;247;142:*.hh=0;38;2;90;247;142:*.gz=4;38;2;154;237;254:*.xz=4;38;2;154;237;254:*.nb=0;38;2;90;247;142:*.7z=4;38;2;154;237;254:*.td=0;38;2;90;247;142:*.so=1;38;2;255;92;87:*.bz=4;38;2;154;237;254:*.vb=0;38;2;90;247;142:*.ex=0;38;2;90;247;142:*.ps=0;38;2;255;92;87:*.el=0;38;2;90;247;142:*.mn=0;38;2;90;247;142:*.cr=0;38;2;90;247;142:*.hs=0;38;2;90;247;142:*.kt=0;38;2;90;247;142:*.cp=0;38;2;90;247;142:*.py=0;38;2;90;247;142:*.ll=0;38;2;90;247;142:*.fs=0;38;2;90;247;142:*.cc=0;38;2;90;247;142:*.di=0;38;2;90;247;142:*.rs=0;38;2;90;247;142:*.hi=0;38;2;102;102;102:*.md=0;38;2;243;249;157:*.pl=0;38;2;90;247;142:*.bc=0;38;2;102;102;102:*.pm=0;38;2;90;247;142:*.ui=0;38;2;243;249;157:*.rb=0;38;2;90;247;142:*.gv=0;38;2;90;247;142:*.sh=0;38;2;90;247;142:*.ml=0;38;2;90;247;142:*.cs=0;38;2;90;247;142:*.jl=0;38;2;90;247;142:*.csv=0;38;2;243;249;157:*.git=0;38;2;102;102;102:*.psd=0;38;2;255;180;223:*.exe=1;38;2;255;92;87:*.c++=0;38;2;90;247;142:*.blg=0;38;2;102;102;102:*.xmp=0;38;2;243;249;157:*.bcf=0;38;2;102;102;102:*.ogg=0;38;2;255;180;223:*.rtf=0;38;2;255;92;87:*.asa=0;38;2;90;247;142:*.dox=0;38;2;165;255;195:*.mkv=0;38;2;255;180;223:*.iso=4;38;2;154;237;254:*.sty=0;38;2;102;102;102:*.toc=0;38;2;102;102;102:*.out=0;38;2;102;102;102:*.bz2=4;38;2;154;237;254:*.xml=0;38;2;243;249;157:*.inc=0;38;2;90;247;142:*.swp=0;38;2;102;102;102:*.png=0;38;2;255;180;223:*.htm=0;38;2;243;249;157:*.tif=0;38;2;255;180;223:*.lua=0;38;2;90;247;142:*.pgm=0;38;2;255;180;223:*.dpr=0;38;2;90;247;142:*.tml=0;38;2;243;249;157:*.cxx=0;38;2;90;247;142:*.def=0;38;2;90;247;142:*.mov=0;38;2;255;180;223:*.apk=4;38;2;154;237;254:*.sbt=0;38;2;90;247;142:*.doc=0;38;2;255;92;87:*.rst=0;38;2;243;249;157:*.fsi=0;38;2;90;247;142:*.zsh=0;38;2;90;247;142:*.tmp=0;38;2;102;102;102:*.eps=0;38;2;255;180;223:*.m4a=0;38;2;255;180;223:*.svg=0;38;2;255;180;223:*.pkg=4;38;2;154;237;254:*.tcl=0;38;2;90;247;142:*.tgz=4;38;2;154;237;254:*.pyc=0;38;2;102;102;102:*.fls=0;38;2;102;102;102:*TODO=1:*.erl=0;38;2;90;247;142:*.dmg=4;38;2;154;237;254:*.fon=0;38;2;255;180;223:*.ps1=0;38;2;90;247;142:*.hxx=0;38;2;90;247;142:*.ipp=0;38;2;90;247;142:*.vcd=4;38;2;154;237;254:*.wma=0;38;2;255;180;223:*.ilg=0;38;2;102;102;102:*.tar=4;38;2;154;237;254:*.deb=4;38;2;154;237;254:*.cpp=0;38;2;90;247;142:*.mpg=0;38;2;255;180;223:*.hpp=0;38;2;90;247;142:*.bst=0;38;2;243;249;157:*.awk=0;38;2;90;247;142:*.mir=0;38;2;90;247;142:*.com=1;38;2;255;92;87:*.vim=0;38;2;90;247;142:*.htc=0;38;2;90;247;142:*.cgi=0;38;2;90;247;142:*.odp=0;38;2;255;92;87:*.mli=0;38;2;90;247;142:*.jar=4;38;2;154;237;254:*.aux=0;38;2;102;102;102:*.xls=0;38;2;255;92;87:*.clj=0;38;2;90;247;142:*.xlr=0;38;2;255;92;87:*.nix=0;38;2;243;249;157:*.pro=0;38;2;165;255;195:*.log=0;38;2;102;102;102:*.csx=0;38;2;90;247;142:*.wmv=0;38;2;255;180;223:*.mp3=0;38;2;255;180;223:*.inl=0;38;2;90;247;142:*.pod=0;38;2;90;247;142:*.kex=0;38;2;255;92;87:*.mid=0;38;2;255;180;223:*.ico=0;38;2;255;180;223:*hgrc=0;38;2;165;255;195:*.bak=0;38;2;102;102;102:*.pbm=0;38;2;255;180;223:*.idx=0;38;2;102;102;102:*.dll=1;38;2;255;92;87:*.m4v=0;38;2;255;180;223:*.bib=0;38;2;243;249;157:*.exs=0;38;2;90;247;142:*.sxw=0;38;2;255;92;87:*.tbz=4;38;2;154;237;254:*.tsx=0;38;2;90;247;142:*.zip=4;38;2;154;237;254:*.gif=0;38;2;255;180;223:*.php=0;38;2;90;247;142:*.otf=0;38;2;255;180;223:*.ods=0;38;2;255;92;87:*.xcf=0;38;2;255;180;223:*.sql=0;38;2;90;247;142:*.pid=0;38;2;102;102;102:*.h++=0;38;2;90;247;142:*.jpg=0;38;2;255;180;223:*.sxi=0;38;2;255;92;87:*.bin=4;38;2;154;237;254:*.swf=0;38;2;255;180;223:*.cfg=0;38;2;243;249;157:*.flv=0;38;2;255;180;223:*.rpm=4;38;2;154;237;254:*.dot=0;38;2;90;247;142:*.odt=0;38;2;255;92;87:*.bat=1;38;2;255;92;87:*.epp=0;38;2;90;247;142:*.bmp=0;38;2;255;180;223:*.ttf=0;38;2;255;180;223:*.pdf=0;38;2;255;92;87:*.ltx=0;38;2;90;247;142:*.vob=0;38;2;255;180;223:*.ind=0;38;2;102;102;102:*.mp4=0;38;2;255;180;223:*.aif=0;38;2;255;180;223:*.arj=4;38;2;154;237;254:*.bag=4;38;2;154;237;254:*.ini=0;38;2;243;249;157:*.bsh=0;38;2;90;247;142:*.kts=0;38;2;90;247;142:*.pas=0;38;2;90;247;142:*.ppt=0;38;2;255;92;87:*.fsx=0;38;2;90;247;142:*.ics=0;38;2;255;92;87:*.ppm=0;38;2;255;180;223:*.img=4;38;2;154;237;254:*.wav=0;38;2;255;180;223:*.yml=0;38;2;243;249;157:*.tex=0;38;2;90;247;142:*.fnt=0;38;2;255;180;223:*.avi=0;38;2;255;180;223:*.txt=0;38;2;243;249;157:*.bbl=0;38;2;102;102;102:*.gvy=0;38;2;90;247;142:*.elm=0;38;2;90;247;142:*.pps=0;38;2;255;92;87:*.rar=4;38;2;154;237;254:*.conf=0;38;2;243;249;157:*.make=0;38;2;165;255;195:*.purs=0;38;2;90;247;142:*.xlsx=0;38;2;255;92;87:*.java=0;38;2;90;247;142:*.hgrc=0;38;2;165;255;195:*.epub=0;38;2;255;92;87:*.pptx=0;38;2;255;92;87:*.h264=0;38;2;255;180;223:*.bash=0;38;2;90;247;142:*.lock=0;38;2;102;102;102:*.fish=0;38;2;90;247;142:*.tiff=0;38;2;255;180;223:*.diff=0;38;2;90;247;142:*.toml=0;38;2;243;249;157:*.html=0;38;2;243;249;157:*.tbz2=4;38;2;154;237;254:*.mpeg=0;38;2;255;180;223:*.psm1=0;38;2;90;247;142:*.json=0;38;2;243;249;157:*.less=0;38;2;90;247;142:*.jpeg=0;38;2;255;180;223:*.psd1=0;38;2;90;247;142:*.docx=0;38;2;255;92;87:*.dart=0;38;2;90;247;142:*.rlib=0;38;2;102;102;102:*.lisp=0;38;2;90;247;142:*.yaml=0;38;2;243;249;157:*.orig=0;38;2;102;102;102:*.flac=0;38;2;255;180;223:*.mdown=0;38;2;243;249;157:*.dyn_o=0;38;2;102;102;102:*.xhtml=0;38;2;243;249;157:*.patch=0;38;2;90;247;142:*shadow=0;38;2;243;249;157:*.cache=0;38;2;102;102;102:*passwd=0;38;2;243;249;157:*.ipynb=0;38;2;90;247;142:*.swift=0;38;2;90;247;142:*.cabal=0;38;2;90;247;142:*.shtml=0;38;2;243;249;157:*.class=0;38;2;102;102;102:*README=0;38;2;40;42;54;48;2;243;249;157:*.toast=4;38;2;154;237;254:*.scala=0;38;2;90;247;142:*.cmake=0;38;2;165;255;195:*.dyn_hi=0;38;2;102;102;102:*.gradle=0;38;2;90;247;142:*INSTALL=0;38;2;40;42;54;48;2;243;249;157:*COPYING=0;38;2;153;153;153:*.matlab=0;38;2;90;247;142:*.ignore=0;38;2;165;255;195:*TODO.md=1:*.config=0;38;2;243;249;157:*.groovy=0;38;2;90;247;142:*.flake8=0;38;2;165;255;195:*LICENSE=0;38;2;153;153;153:*Doxyfile=0;38;2;165;255;195:*TODO.txt=1:*.desktop=0;38;2;243;249;157:*.gemspec=0;38;2;165;255;195:*Makefile=0;38;2;165;255;195:*setup.py=0;38;2;165;255;195:*.markdown=0;38;2;243;249;157:*.rgignore=0;38;2;165;255;195:*configure=0;38;2;165;255;195:*.kdevelop=0;38;2;165;255;195:*.fdignore=0;38;2;165;255;195:*README.md=0;38;2;40;42;54;48;2;243;249;157:*.cmake.in=0;38;2;165;255;195:*COPYRIGHT=0;38;2;153;153;153:*.DS_Store=0;38;2;102;102;102:*README.txt=0;38;2;40;42;54;48;2;243;249;157:*.gitignore=0;38;2;165;255;195:*SConscript=0;38;2;165;255;195:*SConstruct=0;38;2;165;255;195:*.localized=0;38;2;102;102;102:*INSTALL.md=0;38;2;40;42;54;48;2;243;249;157:*.gitconfig=0;38;2;165;255;195:*CODEOWNERS=0;38;2;165;255;195:*.scons_opt=0;38;2;102;102;102:*Dockerfile=0;38;2;243;249;157:*MANIFEST.in=0;38;2;165;255;195:*INSTALL.txt=0;38;2;40;42;54;48;2;243;249;157:*.travis.yml=0;38;2;90;247;142:*Makefile.in=0;38;2;102;102;102:*LICENSE-MIT=0;38;2;153;153;153:*.synctex.gz=0;38;2;102;102;102:*Makefile.am=0;38;2;165;255;195:*.gitmodules=0;38;2;165;255;195:*.applescript=0;38;2;90;247;142:*CONTRIBUTORS=0;38;2;40;42;54;48;2;243;249;157:*.fdb_latexmk=0;38;2;102;102;102:*configure.ac=0;38;2;165;255;195:*appveyor.yml=0;38;2;90;247;142:*.clang-format=0;38;2;165;255;195:*CMakeLists.txt=0;38;2;165;255;195:*CMakeCache.txt=0;38;2;102;102;102:*LICENSE-APACHE=0;38;2;153;153;153:*.gitattributes=0;38;2;165;255;195:*CONTRIBUTORS.md=0;38;2;40;42;54;48;2;243;249;157:*requirements.txt=0;38;2;165;255;195:*CONTRIBUTORS.txt=0;38;2;40;42;54;48;2;243;249;157:*.sconsign.dblite=0;38;2;102;102;102:*package-lock.json=0;38;2;102;102;102:*.CFUserTextEncoding=0;38;2;102;102;102"
# ----------------- initialization ----------------
set -p PATH $HOME/.local/bin
set -p PATH $HOME/.config/rofi/modes
set -x CHROME_EXECUTABLE /usr/bin/google-chrome-stable
# ----------------- ghq   -------------------------
set -x GHQ_ROOT $HOME/ghq
# ----------------- emacs doom --------------------
set -a PATH $HOME/.emacs.d/bin
# ----------------- fzf -------------------------
set -x FZF_DEFAULT_OPTS "
--ansi
--height='80%'
--bind='alt-k:preview-up,alt-p:preview-up'
--bind='alt-j:preview-down,alt-n:preview-down'
--bind='ctrl-r:toggle-all'
--bind='ctrl-s:toggle-sort'
--bind='?:toggle-preview'
--bind='alt-w:toggle-preview-wrap'
--preview-window='right:60%'
+1
"
# ----------------- lf    -------------------------
set -x LF_ICONS "tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf=:*.nix=:"
# ----------------- forgit    -------------------------
set -x FORGIT_NO_ALIASES true
set -x BAT_THEME OneHalfDark
# ----------------- docker    -------------------------
set -x DOCKER_BUILDKIT 1
