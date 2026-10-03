# Arquitetura do Projeto: App World Cup 2026

Este projeto utiliza uma arquitetura baseada no padrão **MVVM (Model-View-ViewModel)**. O objetivo é separar claramente as responsabilidades de interface, lógica de apresentação e acesso a dados.

A estrutura também usa um padrão customizado de **Commands (Comandos)** para facilitar e padronizar o gerenciamento de chamadas assíncronas (como requisições a APIs) e seus estados (carregando, sucesso ou erro).

---

## 1. Camadas da Arquitetura

1. **UI (Views & Widgets)**: Telas do aplicativo. Apenas desenha a interface e escuta as mudanças de estado. Não possui lógica de negócio ou acesso a dados direto.
2. **ViewModel**: Intermediário entre a View e a camada de dados. Guarda o estado da tela (usando `Listenable`, `ValueNotifier` ou `Command`) e expõe métodos para a View acionar ações.
3. **Data / Services**: Responsável pela comunicação com o mundo externo (API com o Dio, banco local com SecureStorage, etc). Retorna dados puros.
4. **Domain / Models**: Classes que representam os objetos de negócio (ex: `User`, `Team`, `Sticker`).

---

## 2. Exemplo Prático: Como funciona uma Feature Simples

Para entender na prática, vamos acompanhar o fluxo da funcionalidade de **Login**:

### Passo 1: A Chamada pela View (UI)
A tela de Login (`LoginScreen`) possui campos de texto e um botão de envio. Ela também tem uma referência direta para o seu respectivo ViewModel (`LoginViewModel`).
Quando o usuário clica em entrar, a View apenas envia os dados para o ViewModel e pede para executar a ação:

```dart
// lib/ui/auth/login/login_screen.dart
Widget build(BuildContext context) {
  return LoginForm(
    onSubmit: () {
      final credentials = (_emailEC.text, _passwordEC.text);
      
      // A view apenas delega a ação ao ViewModel.
      widget.viewmodel.login.execute(credentials);
    }
  );
}
```

### Passo 2: O Gerenciamento no ViewModel
No `LoginViewModel`, declaramos a ação de login como um `Command`. 
Um **Command** encapsula todo o estado de uma chamada assíncrona. Ele sabe se está `running` (carregando) e armazena o `Result` (sucesso ou erro) depois que a chamada finaliza.

```dart
// lib/ui/auth/login/login_viewmodel.dart
class LoginViewModel {
  final AuthRepository _repository;

  // Um Command que recebe uma tupla (String, String) e retorna um AuthToken
  late final login = Command1<AuthToken, (String, String)>(_loginAction);

  Future<Result<AuthToken>> _loginAction((String, String) credentials) async {
    final (email, password) = credentials;
    // O ViewModel pede para o repository (Camada Data) executar a regra
    return await _repository.login(email: email, password: password);
  }
}
```

### Passo 3: A Reatividade na View
Assim que a função `.execute()` é chamada, o `Command` altera internamente seu estado `running` para `true` e notifica quem estiver escutando. A `LoginScreen` escuta essa mudança para exibir o loading ou os erros.

Podemos reagir aos estados do Command de duas formas:
1. Usando o componente customizado **`CommandBuilder`**.
2. Adicionando listeners manualmente (`ListenableBuilder` ou `addListener`).

Exemplo reativo ouvindo o ViewModel:
```dart
void _onLoginResult() {
  final command = widget.viewmodel.login;

  if (command.running) {
    // 1. O Command está rodando: mostra loading
    showLoading(); 
  } else if (command.result case Error(:final error)) {
    // 2. O Command terminou com erro: mostra mensagem
    showError(error);
  } else if (command.result != null) {
    // 3. O Command terminou com sucesso: segue para próxima tela
    goToHome();
  }
}
```

---

## 3. Benefícios dessa Arquitetura

* **Separação de Responsabilidades**: Se a API mudar, alteramos apenas o Serviço/Repositório. Se o design da tela mudar, alteramos apenas a View. O ViewModel fica intacto.
* **Padronização de Estados Assíncronos**: Com o `Command` e `Result<T>`, nós abolimos o lançamento de exceções soltas e variáveis redundantes como `isLoading = true`, `String errorMessage`. Fica padronizado.
* **Testabilidade**: Podemos testar a lógica do ViewModel enviando repositórios falsos (Mocks), já que ele não depende de nenhum Widget do Flutter de forma direta.
