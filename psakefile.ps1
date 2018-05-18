Task Default -Depends Link

Task Link {
    # -----[ dotfiles ]--------------------------
    Get-ChildItem -File -Path 'src' | %{
        $link = Join-Path (Resolve-Path '~') $_.Name
        $target = $_.FullName

        Remove-Item -Force -Path $link | Out-Null

        cmd /c mklink $link $target
    }

    # -----[ gpg ]-------------------------------
    $gpgdir = Join-Path (Resolve-Path '~') '.gnupg'

    New-Item -Force -Path $gpgdir -Type Directory | Out-Null

    Get-ChildItem -File -Path 'src/.gnupg' | %{
        $link = Join-Path $gpgdir $_.Name
        $target = $_.FullName

        Remove-Item -Force -Path $link | Out-Null

        cmd /c mklink $link $target
    }

    # -----[ subversion ]------------------------
    $svndir = Join-Path $ENV:APPDATA 'Subversion'

    New-Item -Force -Path $svndir -Type Directory | Out-Null

    Get-ChildItem -File -Path 'src/.subversion' | %{
        $link = Join-Path $svndir $_.Name
        $target = $_.FullName

        Remove-Item -Force -Path $link | Out-Null

        cmd /c mklink $link $target
    }

    # -----[ sublimetext ]-----------------------
    $subldir = Join-Path $ENV:APPDATA 'Sublime Text 3/Packages/User'

    New-Item -Force -Path $subldir -Type Directory | Out-Null

    Get-ChildItem -File -Path 'src/.sublime' | %{
        $link = Join-Path $subldir $_.Name
        $target = $_.FullName

        Remove-Item -Force -Path $link | Out-Null

        cmd /c mklink $link $target
    }
}
