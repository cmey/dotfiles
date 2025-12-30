winget install Git.Git
winget install GitHub.cli
winget install 7zip.7zip
winget install GitHub.GitLFS
winget install PDFArranger.PDFArranger
winget install Adobe.Acrobat.Reader.64-bit
winget install Microsoft.PowerShell
winget install Dropbox.Dropbox
winget install Google.Chrome.EXE
winget install WinSCP.WinSCP
winget install Mobatek.MobaXterm
winget install Gyan.FFmpeg
winget install Obsidian.Obsidian
winget install AgileBits.1Password
winget install Meld.Meld  # meld (diff tool)
winget install Neovim.Neovim
winget install "RipGrep MSVC"  # rg
winget install junegunn.fzf
winget install sharkdp.fd  # fd
winget install ajeetdsouza.zoxide
winget install JanDeDobbeleer.OhMyPosh -s winget
# then follow: https://ohmyposh.dev/docs/installation/fonts and https://ohmyposh.dev/docs/installation/prompt

# then write in C:\Users\ChristopheMeyer\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 :

# oh-my-posh init pwsh  --config 'C:\Users\ChristopheMeyer\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json' | Invoke-Expression
# $env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# git aliases
# function Get-GitStatus { & git status $args }
# New-Alias -Name gst -Value Get-GitStatus

Invoke-Expression (& { (zoxide init powershell | Out-String) })
