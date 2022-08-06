# dotfiles
```bash
git clone https://github.com/LittleTealeaf/dotfiles .dotfiles
```

## Windows Installations
```pwsh
oh-my-posh init pwsh --config f:\.dotfiles\.theme.omp.json | Invoke-Expression
```

## Linux Installations
```pwsh
echo 'eval "$(oh-my-posh init bash --config /mnt/f/.dot-config/.theme.omp.json)"' >> ~/.bashrc
```
