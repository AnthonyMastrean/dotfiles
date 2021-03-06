Task Default -Depends Link

Task Link {
    # -----[ bin ]-------------------------------
    Get-ChildItem -File -Path 'bin' | %{
        $link = Join-Path (Resolve-Path '~') $_.Name
        $target = $_.FullName

        if (Test-Path $link) {
            Remove-Item -Force -Path $link | Out-Null
        }

        New-Item -Path $link -ItemType SymbolicLink -Value $target
    }

    # -----[ dotfiles ]--------------------------
    Get-ChildItem -File -Path 'src' | %{
        $link = Join-Path (Resolve-Path '~') $_.Name
        $target = $_.FullName

        if (Test-Path $link) {
            Remove-Item -Force -Path $link | Out-Null
        }

        New-Item -Path $link -ItemType SymbolicLink -Value $target
    }

    # -----[ gpg ]-------------------------------
    $gpgdir = Join-Path $ENV:APPDATA 'gnupg'

    New-Item -Force -Path $gpgdir -Type Directory | Out-Null

    Get-ChildItem -File -Path 'src/.gnupg' | %{
        $link = Join-Path $gpgdir $_.Name
        $target = $_.FullName

        if (Test-Path $link) {
            Remove-Item -Force -Path $link | Out-Null
        }

        New-Item -Path $link -ItemType SymbolicLink -Value $target
    }
}
