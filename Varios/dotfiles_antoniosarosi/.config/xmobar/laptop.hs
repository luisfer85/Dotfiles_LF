-- http://projects.haskell.org/xmobar/

Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true",
    bgColor = "#292d3e",
    fgColor = "#f07178",
    lowerOnStart = True,
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    commands = [ 
        Run Date "  %d %b %Y %H:%M " "date" 60,
        Run Com "pamixer" ["--get-volume-human"] "volume" 1,
        Run Com "/home/antonio/.config/xmobar/battery.sh" [] "battery" 60,
        Run Com "/home/antonio/.config/xmobar/updates.sh" [] "updates" 3600,
        Run Com "/home/antonio/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 20,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "<fc=#b303ff>  </fc>%UnsafeStdinReader% }{ \
        \<fc=#e1acff> %updates% </fc>\
        \<fc=#c3e88d> %battery% </fc>\
        \<fc=#82AAFF>  %volume% </fc>\
        \<fc=#8BE9FD> %date% </fc>\
        \%trayerpad%"
}
