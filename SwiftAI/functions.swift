import Foundation

func formatText(_ text: String? = nil, terminator: Bool = false) {
    
    if let text {
        for num in 0...text.count {
            print("-", terminator: "")
            if num == text.count {
                print()
            }
        }
    }
    
    if let text {
        
        if terminator {
            
            print(text, terminator: "")
            
        } else {
            
            print(text)
            
            for num in 0...text.count {
                
                print("-", terminator: "")
                
                if num == text.count {
                    print()
                }
            }
        }
    }
    
}

func loadingAnimation(duration: TimeInterval) {
    let startTime = Date()

    while Date().timeIntervalSince(startTime) < duration {
        print(">", terminator: "")
        fflush(stdout)
        Thread.sleep(forTimeInterval: 0.3) // Pausa breve para controlar a velocidade
    }
}

func openFile(nomeArquivo: String) -> String? {
    guard var caminho = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path() else {
            return nil
    }
    caminho += nomeArquivo
    print(caminho)


    do {
        let conteudo = try String(contentsOfFile: caminho, encoding: .utf8)
        return conteudo
    } catch {
        print("Erro ao ler o arquivo: \(error)")
        return nil
    }
}
