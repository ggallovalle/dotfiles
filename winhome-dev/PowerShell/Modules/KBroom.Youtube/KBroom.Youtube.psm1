# TODO: make a Get-YoutubeMusic function

$script:Config = @{
    OutputTemplate = "%(channel)s/%(title)s--%(upload_date>%Y-%m-%d)s.%(ext)s"
    OutputPath  = Join-Path $HOME "media" "youtube"
    VideoQuality = "720"
    # AudioFormat = "mp3"
}

<#
.SYNOPSIS
    Dowload something from youtube via yt-dlp command
.PARAMETER OutputPath
    Specifies where to download. Default "~/media/youtube"
.PARAMETER OutputTemplate
    Template for the file name to be downloaded
.PARAMETER Audio
    Also download audio file in the format specified at -AudioFormat
.PARAMETER AudioFormat
    Format of the audio file. Default "mp3". One of "mp3", "aac", "flac"
.PARAMETER VideoQuality
    Quality of the video. Default "720". One of "1080", "720", "480", "360"
#>
function Get-Youtube {
    [CmdletBinding()]
    param(
        [string]$OutputPath,
        [string]$OutputTemplate,
        # [switch]$Audio,
        # [ValidateSet("mp3", "aac", "flac")]
        # [string]$AudioFormat,
        [ValidateSet("1080", "720", "480", "360")]
        [string]$VideoQuality,
        [Parameter(Position = 0)]
        [string[]]$Urls
    )
    begin {
        $effectiveOutputPath  = if ($PSBoundParameters.ContainsKey('OutputPath')) { $OutputPath } else { $script:Config.OutputPath }
        $effectiveOutputTemplate = if ($PSBoundParameters.ContainsKey('OutputTemplate')) { $VideoQuality } else { $script:Config.OutputTemplate }
        # $effectiveAudioFormat = if ($PSBoundParameters.ContainsKey('AudioFormat')) { $AudioFormat } else { $script:Config.AudioFormat }
        $effectiveVideoQuality = if ($PSBoundParameters.ContainsKey('VideoQuality')) { $VideoQuality } else { $script:Config.VideoQuality }

        Push-Location $effectiveOutputPath
    }
    process {
        $ytArgs = @(
            "-t", "mkv",
            "-S", "res:$effectiveVideoQuality,fps",
            "-o", $effectiveOutputTemplate,
            "--restrict-filenames",
            "--no-sponsorblock",
            "--write-info-json",
            "--clean-info-json",
            "--add-metadata",
            "--no-write-comment"
        )

        # if ($Audio) {
        #     $ytArgs += @("--extract-audio", "--audio-format", $effectiveAudioFormat)
        # }

        # Add URLs last
        $ytArgs += $Urls

        if ($DebugPreference -eq 'Continue') {
            Write-Debug "Args: $ytArgs"
        }
        else {
            yt-dlp.exe @ytArgs
        }

    }
    clean {
        Pop-Location
    }
}