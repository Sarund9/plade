package main


import "core:os"
import fpath "core:path/filepath"
import "core:log"

import lua "shared:odin-lua/"
import "shared:mani"


ProgramArgs :: struct {
    // path to the game
    gamePath: string,

    // 
}


main :: proc() {
    
    context.logger = log.create_console_logger()

    if len(os.args) < 1 {
        log.fatal("Not enough arguments")
        return
    }

    gamePath := os.args[1]
    
    if !os.exists(gamePath) {
        log.fatal("Path not found:", gamePath)
        return
    }
    if !os.is_dir(gamePath) {
        log.fatal("Path is not Directory:", gamePath)
        return
    }

    mainFile := fpath.join({ gamePath, "main.lua" })

    if !os.exists(mainFile) {
        log.fatal("Main file not found:", gamePath)
        return
    }

    log.info("Run:", mainFile)

    d := lua.newstate()

}







