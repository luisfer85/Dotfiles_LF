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
        Run Network "wlp2s0" ["-t", " <rx>kb  <tx>kb"] 30,
        Run Cpu ["-t", " (<total>%)","-H","50","--high","red"] 20,
        Run Memory ["-t", "  <used>M (<usedratio>%)"] 20,
        Run Com "pamixer" ["--get-volume-human"] "volume" 1,
        Run Com "/home/antonio/.config/xmobar/updates.sh" [] "updates" 3600,
        Run UnsafeStdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "<fc=#b303ff>   </fc> %UnsafeStdinReader% }{ \
        \<fc=#e1acff> %updates% </fc>\
        \<fc=#FFB86C> %cpu% </fc>\
        \<fc=#FF5555> %memory% </fc>\
        \<fc=#c3e88d> %wlp2s0%  </fc>\
        \<fc=#82AAFF>  %volume% </fc>\
        \<fc=#8BE9FD> %date% </fc>"
}
