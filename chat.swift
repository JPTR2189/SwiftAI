import Foundation
import GoogleGenerativeAI
import Darwin


class Generative {
    
    var model = GenerativeModel(name: "gemini-2.0-flash", apiKey: "AIzaSyC_JTlGp6RoWy3tPgimeGxJ4H5RV4VzlZQ", systemInstruction: "A Partir de agora você é uma Inteligência artifical chamada 'Leo', uma IA especiliazada na linguagem de programação Swift. Você tem grande conhecimento sobre desenvolvimento de software e alta de pensamento crítico e analítico, focado em encontrar soluções para problemas e identificar erros de sintaxe e lógica de programação. Você não pode responder qualquer pergunta que não esteja relacionada a linguagem swift. Quando você for imprimir a resposta, não use a formatação de markdown, coloque # para os títulos e não use negrito, use ##.")
    
    var prompt: String = "Não me responda nada após o final desse comando, apenas retorne para mim o texto: 'Olá, sou o Leo, uma inteligência artifcial treinada e com alta capacidade para analisar códigos em Swift, encontrar erros e corrigi-los! Como posso ajudar?'"
    
    var modelResponse: String = ""
    var first = true
    
    func swiftAI() async {
        let chat = model.startChat(history: [])
        var response = try? await chat.sendMessage(prompt)
        var userPrompt = ""
        while userPrompt.lowercased() != "fim" {
            
            if first {
                modelResponse = response?.text ?? "No response"
                print("🤖 SwiftIA: \(modelResponse)")
                first = false
            }
            
            print("👨🏼‍🦰 User:", terminator: " ")
            userPrompt = readLine() ?? ""
            
            loadingAnimation(duration: 3)
            
            response = try? await chat.sendMessage(userPrompt)
            modelResponse = response?.text ?? "No response"
            let modelResponse2 = modelResponse.replacingOccurrences(of: "**", with: "")
            let modelResponse3 = modelResponse2.replacingOccurrences(of: "```swift", with: "<------------------------------- SWIFT Início ------------------------------->\n")
            let modelResponse4 = modelResponse3.replacingOccurrences(of: "```", with: "\n<------------------------------- SWIFT Fim ------------------------------->")
            
            print("\n\n🤖 SwiftIA: \(modelResponse4)")
            
        }
        
        formatText("Obrigado por usar o SwiftAI! 😎🤖")
        exit(0)
    }
    
}

