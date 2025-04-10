import Foundation

var titulo = ("""
 ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖     ▗▄▖ ▗▄▄▄▖
▐▌   ▐▌ ▐▌  █  ▐▌     █      ▐▌ ▐▌  █  
 ▝▀▚▖▐▌ ▐▌  █  ▐▛▀▀▘  █      ▐▛▀▜▌  █  
▗▄▄▞▘▐▙█▟▌▗▄█▄▖▐▌     █      ▐▌ ▐▌▗▄█▄▖
                                       
""")

formatText(titulo)
let gemini = Generative()

Task {
    await gemini.swiftAI()
}
RunLoop.main.run()


