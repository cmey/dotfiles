winget install "RipGrep MSVC"  # rg
winget install sharkdp.fd  # fd
winget install Neovim.Neovim
winget install Meld.Meld  # meld (diff tool)
winget install JanDeDobbeleer.OhMyPosh -s winget
# then follow https://ohmyposh.dev/docs/installation/fonts and https://ohmyposh.dev/docs/installation/prompt

# then write in C:\Users\ChristopheMeyer\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# oh-my-posh init pwsh  --config 'C:\Users\ChristopheMeyer\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json' | Invoke-Expression
# $env:VIRTUAL_ENV_DISABLE_PROMPT = 1
# git aliases
# function Get-GitStatus { & git status $args }
# New-Alias -Name gst -Value Get-GitStatus
